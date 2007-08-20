From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 16:49:07 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <C03A3C267DDF184EA523BBAB577BF924C2301F@blrexsr1.slti.sanyo.co.in>
References: <C03A3C267DDF184EA523BBAB577BF924C2301F@blrexsr1.slti.sanyo.co.in>
Message-ID: <20070820144907.GD23522@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 19, 2007 at 01:43:12PM +0530, Gururaja Hebbar K R wrote:
>Hi All,
> 
>  Thanks for all your feedbacks. I tried again with latest snapshot
>(today's) again ran into same problem really no idea y. Probably below
>attached buildroot make steps would help you out. I am also attaching my
>buildroot .config file & uclibc-0.9.29-wchar.config file. Really Hoping
>to solve this soon. 
>
> 
> 
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c conf.c -o conf.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o
>kxgettext.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
>lxdialog/checklist.c -o lxdialog/checklist.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
>lxdialog/inputbox.c -o lxdialog/inputbox.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/menubox.c
>-o lxdialog/menubox.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/textbox.c
>-o lxdialog/textbox.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/util.c -o
>lxdialog/util.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/yesno.c
>-o lxdialog/yesno.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c mconf.c -o mconf.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -I. -c zconf.tab.c -o
>zconf.tab.o
>/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -lncursesw conf.o
>zconf.tab.o -o conf
>.config:64:warning: trying to assign nonexistent symbol HAS_FPU
>.config:141:warning: trying to reassign symbol
>UCLIBC_PREGENERATED_LOCALE_DATA
>.config:142:warning: trying to reassign symbol
>UCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA
>.config:143:warning: trying to reassign symbol UCLIBC_HAS_XLOCALE
>.config:145:warning: trying to reassign symbol
>UCLIBC_HAS_GLIBC_DIGIT_GROUPING
>.config:220:warning: trying to reassign symbol CONFIG_ARM_OABI
>.config:221:warning: trying to reassign symbol CONFIG_ARM_EABI
>.config:223:warning: trying to assign nonexistent symbol LINUXTHREADS
>.config:225:warning: trying to assign nonexistent symbol
>UCLIBC_HAS_THREADS_NATIVE
>*
>* uClibc Configuration
>*
>Target Architecture
>  1. alpha (TARGET_alpha)
>> 2. arm (TARGET_arm)
>  3. bfin (TARGET_bfin)
>  4. cris (TARGET_cris)
>  5. e1 (BROKEN) (TARGET_e1)
>  6. frv (BROKEN) (TARGET_frv)
>  7. h8300 (BROKEN) (TARGET_h8300)
>  8. hppa (TARGET_hppa)
>  9. i386 (TARGET_i386)
>  10. i960 (BROKEN) (TARGET_i960)
>  11. ia64 (TARGET_ia64)
>  12. m68k (TARGET_m68k)
>  13. microblaze (BROKEN) (TARGET_microblaze)
>  14. mips (TARGET_mips)
>  15. nios (TARGET_nios)
>  16. nios2 (TARGET_nios2)
>  17. powerpc (TARGET_powerpc)
>  18. superh (TARGET_sh)
>  19. sh64 (TARGET_sh64)
>  20. sparc (TARGET_sparc)
>  21. v850 (BROKEN) (TARGET_v850)
>  22. vax (TARGET_vax)
>  23. x86_64 (TARGET_x86_64)
>choice[1-23?]: 2
>*
>* Target Architecture Features and Options
>*
>Target ABI
>> 1. OABI (CONFIG_ARM_OABI)
>  2. EABI (CONFIG_ARM_EABI)
>choice[1-2?]: 1
>Use BX in function return (USE_BX) [Y/n/?] (NEW) 

I do not see any problem in the snippet you pasted above.
Please describe your problem (and perhaps adjust the subject of this
mail accordingly).
