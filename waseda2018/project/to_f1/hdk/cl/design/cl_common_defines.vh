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

`ifndef CL_COMMON_DEFAULTS
`define CL_COMMON_DEFAULTS

// Value to return for PCIS access to unimplemented register address
`define UNIMPLEMENTED_REG_VALUE 32'hdeaddead

/////////////////////////////////////////////////
/// FPGA TUTORIAL WASEDA 2018 (Start)
/////////////////////////////////////////////////

// CL Register Addresses
`define HELLO_WORLD_REG_ADDR    32'h0000_0500
`define WASEDA_REG1_ADDR        32'h0000_0504
`define WASEDA_REG2_ADDR        32'h0000_0508
`define WASEDA_REG3_ADDR        32'h0000_050c
`define WASEDA_REG4_ADDR        32'h0000_0510
`define WASEDA_REG5_ADDR        32'h0000_0514

/////////////////////////////////////////////////
/// FPGA TUTORIAL WASEDA 2018 (End)
/////////////////////////////////////////////////

`endif