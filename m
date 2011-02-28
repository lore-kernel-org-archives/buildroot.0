From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Feb 2011 12:44:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3325] ffmpeg fails to build
In-Reply-To: <bug-3325-163@https.bugs.busybox.net/>
References: <bug-3325-163@https.bugs.busybox.net/>
Message-ID: <20110228124409.9F8968F7AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3325

--- Comment #2 from Bart?omiej Palmowski <rotwang@crux.org.pl>  ---
I did as you suggested but it still doesn't work

libavcodec/x86/h264dsp_mmx.c: In function 'h264_h_loop_filter_luma_mmx2':
libavcodec/x86/dsputil_mmx.c:681: error: can't find a register in class
'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/dsputil_mmx.c:681: error: can't find a register in class
'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/dsputil_mmx.c:681: error: 'asm' operand has impossible
constraints

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
