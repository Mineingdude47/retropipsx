#!/usr/bin/env bash

# This file is part of RetroPie-Extra, a supplement to RetroPie.
# For more information, please visit:
#
# https://github.com/RetroPie/RetroPie-Setup
# https://github.com/Exarkuniv/RetroPie-Extra
#
# See the LICENSE file distributed with this source and at
# https://raw.githubusercontent.com/Exarkuniv/RetroPie-Extra/master/LICENSE
#

rp_module_id="lr-blastem"
rp_module_desc="Sega Genesis emu - BlastEm port for libretro"
rp_module_help="ROM Extensions: .md .bin .smd .zip .7z\n\nCopy the required BIOS file rom.db to $biosdir"
rp_module_licence="GPL3 https://raw.githubusercontent.com/libretro/blastem/master/COPYING"
rp_module_repo="git https://github.com/libretro/blastem libretro"
rp_module_section="exp"
rp_module_flags="!all 64bit !rpi5"

function sources_lr-blastem() {
    gitPullOrClone
}

function build_lr-blastem() {
    make -f Makefile.libretro clean
    make -f Makefile.libretro
    md_ret_require="$md_build/blastem_libretro.so"
}

function install_lr-blastem() {
    md_ret_files=(
        'COPYING'
        'blastem_libretro.so'
    )
}

function configure_lr-blastem() {
    mkRomDir "megadrive"
    ensureSystemretroconfig "megadrive"

    addEmulator 1 "$md_id" "megadrive" "$md_inst/blastem_libretro.so"
    addSystem "megadrive"
}