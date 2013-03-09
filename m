From: Marc Schultz <marcschultz27@gmail.com>
Date: Sat, 9 Mar 2013 12:37:12 +0100
Subject: [Buildroot] Fwd: Google doesn't help Buildroot newcomers really much
In-Reply-To: <CAMFO431gatpdNG5oEcAQqCWVLs6St6-0P1SBA3h3SiTimk5tvg@mail.gmail.com>
References: <CAMFO431gatpdNG5oEcAQqCWVLs6St6-0P1SBA3h3SiTimk5tvg@mail.gmail.com>
Message-ID: <CAMFO433vmKwUuc6ap2654izNBpchHu7_6wzG10MisbGO9rvF6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Buildroot team!

I'd like to make buildroot running on a similar board of BF537-STAMP. Now I
want to change the sound device to a Cirrus Logic CS4270, but after booting
the uImage and loading as much sound modules as I can (e.g. snd-soc-cs4270)
"aslactl init" says that there is no sound card. Do I have to modify the
board file "linux/linux-kernel/arch/<my_arch>/mach-<board_arch>/<board>.c"
and if yes, is there a good workflow for that to prevent
hard-to-debug-mistakes?

The ALSA-Project
website<http://www.alsa-project.org/main/index.php/Matrix%3aModule-cs4270>
shows
a specific module named "snd-cs4270". Can I get this module installed by
buildroot or do I have to download and integrate it into my target hardware
on my own?

I'm using the buildroot revision from
Blackfin<http://docs.blackfin.uclinux.org/doku.php?id=buildroot:build-system:build_a_target>
(2012.08)
and I get this thing booting on my target hardware. Now I wanted to try the
newest Buildroot revision (2013.05) from your website, but I always get a
"No rule to make target `uImage'.  Stop." compiling error. Any idea what I
might have done wrong?

Thanks for your help!

Regards,
Marc Schultz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130309/5e631ae8/attachment.html>
