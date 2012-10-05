From: Martin Peevski <martin@ronetix.at>
Date: Fri, 05 Oct 2012 17:42:46 +0300
Subject: [Buildroot] ALSA don't work
Message-ID: <506EF1E6.2090902@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I build a Linux system with Buildroot but it don't work - impossible 
to start applications. This is theconsole  log:

# aplay -l
aplay: device_list:252: no soundcards found...
[16:11:18] engineerpeevski: # alsactl init
alsactl: init:1743: No soundcards found...
[16:11:30] engineerpeevski: # alsaconf
-sh: alsaconf: not found

Also when the Kernel boots there is a message that a sound card was 
found and with another rootfs it works. I think that it's something in 
the config, can you help me, please? I work with AT91SAM9G45 SoC.

Thanks in  advance, Martin!
