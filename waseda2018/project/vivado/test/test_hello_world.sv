// Amazon FPGA Hardware Development Kit
//
// Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.


module test_hello_world();

import tb_type_defines_pkg::*;
`include "cl_common_defines.vh" // CL Defines with register addresses

tb tb();
// AXI ID
parameter [5:0] AXI_ID = 6'h0;

logic [31:0] rdata;
logic [31:0] idata;
logic [15:0] vdip_value;
logic [15:0] vled_value;

   initial begin

      tb.power_up();
      
      $display ("Writing 0xDEAD_BEEF to address 0x%x", `HELLO_WORLD_REG_ADDR);
      tb.poke(.addr(`HELLO_WORLD_REG_ADDR), .data(32'hDEAD_BEEF), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL)); // write register

      tb.peek(.addr(`HELLO_WORLD_REG_ADDR), .data(rdata), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL));         // start read & write
      $display ("Reading 0x%x from address 0x%x", rdata, `HELLO_WORLD_REG_ADDR);

      if (rdata == 32'hEFBE_ADDE) // Check for byte swap in register read
        $display ("TEST PASSED");
      else
        $display ("TEST FAILED");

// start WASEDA_REG1_ADDR test 
      tb.peek(.addr(`WASEDA_REG1_ADDR), .data(idata), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL));         // read register initial value
      $display ("Reading 0x%x from address 0x%x", idata, `WASEDA_REG1_ADDR);

      $display ("Writing 0x0000_00EF to address 0x%x", `WASEDA_REG1_ADDR);
      tb.poke(.addr(`WASEDA_REG1_ADDR), .data(32'h0000_00EF), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL)); // write register first

      tb.peek(.addr(`WASEDA_REG1_ADDR), .data(rdata), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL));         // read register
      $display ("Reading 0x%x from address 0x%x", rdata, `WASEDA_REG1_ADDR);

      if ((rdata - idata) == 32'h0000_00EF) // Check for add value in register read
        $display ("TEST PASSED");
      else
        $display ("TEST FAILED");

      $display ("Writing 0x0000_00EF to address 0x%x", `WASEDA_REG1_ADDR);
      tb.poke(.addr(`WASEDA_REG1_ADDR), .data(32'h0000_00EF), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL)); // write register second

      tb.peek(.addr(`WASEDA_REG1_ADDR), .data(rdata), .id(AXI_ID), .size(DataSize::UINT16), .intf(AxiPort::PORT_OCL));         // read register
      $display ("Reading 0x%x from address 0x%x", rdata, `WASEDA_REG1_ADDR);

      if ((rdata - idata) == 32'h0000_01DE) // Check for add value in register read
        $display ("TEST PASSED");
      else
        $display ("TEST FAILED");

      tb.kernel_reset();

      tb.power_down();
      
      $finish;
   end

endmodule // test_hello_world
