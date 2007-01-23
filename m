From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 23 Jan 2007 01:18:56 +0100
Subject: [Buildroot] microcom broken with latest uclibc snapshot.
In-Reply-To: <049801c73e80$cf0bedf0$01c4af0a@atmel.com>
References: <049801c73e80$cf0bedf0$01c4af0a@atmel.com>
Message-ID: <20070123001856.GA10178@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2007 at 12:32:37AM +0100, Ulf Samuelsson wrote:
>When using the latest uClibc snapshot to build the toolchain,
>It looks like the high speeds are not acceptable (> 1151200) 
>and the generated <staging_dir>/arm-linux/sys-include/bits/termios.h
>has higher speeds commented away.
>
>#if 0 /* limited on uClibc, keep in sync w/ cfsetspeed.c */
>#define B230400 0010003
>...
>#endif
>
>This is not a good idea, if the MCU can handle higher speed!
>
>It also breaks microcom-1.02.

I'm pretty sure that i fixed microcom, please update and confirm since i
only compile tested it..
