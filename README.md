![Docker Pulls](https://img.shields.io/docker/pulls/dilawars/xyce)

# docker-xyce

[Docker image of Xyce simulator](https://hub.docker.com/r/dilawars/xyce) based on Archlinux. It uses AUR repo
https://aur.archlinux.org/packages/xyce-serial to build Xyce (serial only).

# Usage

```bash
docker run -it dilawars/xyce:7.4.0 Xyce -h
Usage: Xyce [arguments] netlist

Arguments:
  -b                          batch mode flag for spice compatibility (ignored)
  -h                          print usage and exit
  -v                          print version info and exit
  -capabilities               print compiled-in options and exit
  -license                    print license and exit
  -param [device [level [<inst|mod>]]] print a terse summary of model and/or device parameters
  -doc [device [level [<inst|mod>]]] output latex tables of model and device parameters to files
  -doc_cat [device [level [<inst|mod>]]] output latex tables of model and device parameters to files
  -count                      device count without netlist syntax or topology check
  -syntax                     check netlist syntax and exit
  -norun                      netlist syntax and topology and exit
  -namesfile <path>           output internal names file to <path> and exit
  -noise_names_file <path>    output noise source names file to <path> and exit
  -quiet                      suppress some of the simulation-progress messages sent to stdout
  -jacobian_test              jacobian matrix diagnostic
  -delim <TAB|COMMA|string>   set the output file field delimiter
  -o <basename>               <basename> for the output file(s)
  -l <path>                   place the log output into <path>, "cout" to log to stdout
  -per-processor              create log file for each procesor, add .<n>.<r> to log path
  -remeasure [existing Xyce output file] recompute .measure() results with existing data
  -nox <on|off>               NOX nonlinear solver usage
  -linsolv <solver>           force usage of specific linear solver
  -maxord <1..5>              maximum time integration order
  -prf <param file name>      specify a file with simulation parameters
  -rsf <response file name>   specify a file to save simulation responses functions.
  -r <file>                   generate a rawfile named <file> in binary format
  -a                          use with -r <file> to output in ascii format
  -randseed <number>          seed random number generator used by expressions and sampling methods
  -plugin <plugin list>       load device plugin libraries (comma-separated list)
```
