From: Vijay <techvd@gmail.com>
Date: Fri, 31 Jul 2020 18:01:37 -0700
Subject: [Buildroot] Cannot get build to use start_x.elf and fixup_x.dat
 Raspberry Pi 3
Message-ID: <CAOnXkYsPPXA5K2gX0nAU58hdoBB6yEt+ov5J7KCa2iF5MLTv_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm fairly new to buildroot and cannot find a solution to this problem I'm
having. Everything works well for me and I'm able to create the SD card
images to run on my Pi 3. However, I'm trying to get the extended ("x")
firmware to boot. In the Target Packages > Hardware Handling > Firmware
section, I'm selecting the extended option. Buildroot is building all the
different variations of the start.elf (including start_x.elf, start_cd.elf)
but only using the start.elf file in the final image instead of the
start_x.elf file (same with fixup.dat). So basically whether I select the
"default" option on that screen or "extended," the resulting boot image is
the same. If I manually copy the start_x.elf and fixup_x.dat files as
start.elf and fixup.dat the I get the extended functionality - specifically
the camera working.

I hope all that makes sense. Please let me know if you need any further
information. Any help is greatly appreciated.

Thanks,
Vijay Dirisala
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200731/c7d92932/attachment.html>
