From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 00:57:46 +0200
Subject: [Buildroot] Question concerning buildroot-libtool.patch
Message-ID: <201006240057.46368.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just tried to bump pidgin/finch (instant messenger I've send a patch a whole 
ago) to 2.7.1 but unfortunately building it fails while patching the 
ltmain.sh.

>>>   Patching libtool

Applying buildroot-libtool.patch using plaintext:
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 5416 (offset 3008 lines).
Hunk #3 FAILED at 5560.
Hunk #4 FAILED at 5904.
Hunk #5 succeeded at 8076 with fuzz 1 (offset 2453 lines).
Hunk #6 FAILED at 8401.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make: *** [/avr/buildroot/output/build/pidgin-2.7.0/.stamp_patched] Error 1


It used to work with an older version of Buildroot (~ git 2010-05-14) - but as 
far as I can see nothing has changed on the patch / or the pidgin source I've 
used.

Any ideas how I can fix this? Unfortunately I'm not that into the whole 
buildroot system (yet, but I'd like to learn and contribute to it).


It seems to compile fine without this patch (although I've not tested the 
binary)


Thanks,
Peter
