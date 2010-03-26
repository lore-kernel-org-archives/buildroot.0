From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 08:42:09 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100326084209.84CB6211AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399





--- Comment #1 from Paul Jones <paul.jones@iwtech.com.au>  2010-03-26 08:42:08 UTC ---
Same problem occurs with xfont_font-adobe-75dpi-1.0.1

  GEN    timR24.pcf.gz
  GEN    symb12.pcf.gz
  GEN    symb10.pcf.gz
  GEN    symb14.pcf.gz
  GEN    symb18.pcf.gz
  GEN    symb24.pcf.gz
  GEN    courB08-ISO8859-1.bdf
/bin/sh: courB08.bdf: command not found
make[1]: *** [courB08-ISO8859-1.bdf] Error 127
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/media/stuff/kisssroot/output/build/xfont_font-adobe-75dpi-1.0.1'
make: ***
[/media/stuff/kisssroot/output/build/xfont_font-adobe-75dpi-1.0.1/.stamp_built]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
