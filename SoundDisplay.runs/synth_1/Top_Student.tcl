# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.cache/wt} [current_project]
set_property parent.project_path {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/AudioVolumeIndicator.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/Audio_Capture.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/CLOCK_20khz.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/FrequencyIndicator.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/MenuModule.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/OLED_button.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/Oled_Display.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/TunerDisplay.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/coordinates.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/freq_display.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/oled_taskA.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/oled_taskB.v}
  {C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/sources_1/new/Top_Student.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/johnc/Documents/Sch Stuff/Year 2/Sem 1/EE2026/Gitrepo/EE2026-Project/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top_Student -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top_Student.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_Student_utilization_synth.rpt -pb Top_Student_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
