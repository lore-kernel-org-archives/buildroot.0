From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 20:14:54 +0200 (CEST)
Subject: [Buildroot] packages/dhcp
Message-ID: <0707082005180.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 3.0.5 is no longer available.
3.0.6 is the nearest you could get.
Looks like dhcp_execute.patch is still applicable,

  Applying dhcp_xecute.patch using plaintext:
  patching file common/conflex.c
  Hunk #1 succeeded at 728 (offset 52 lines).
  patching file common/dhcp-eval.5
  Hunk #1 succeeded at 414 (offset 5 lines).
  patching file common/parse.c
  Hunk #1 succeeded at 3640 (offset 1 line).
  patching file common/print.c
  patching file common/tree.c
  Hunk #4 succeeded at 2202 (offset 2 lines).
  Hunk #5 succeeded at 2713 (offset 2 lines).
  Hunk #6 succeeded at 3131 (offset 2 lines).
  Hunk #7 succeeded at 3169 (offset 2 lines).
  Hunk #8 succeeded at 3198 (offset 2 lines).
  Hunk #9 succeeded at 3297 (offset 2 lines).
  Hunk #10 succeeded at 3360 (offset 2 lines).
  Hunk #11 succeeded at 3833 (offset 2 lines).
  Hunk #12 succeeded at 4072 (offset 2 lines).
  patching file includes/dhctoken.h
  Hunk #1 succeeded at 309 (offset 1 line).
  patching file includes/site.h
  patching file includes/tree.h

It looks like that, anyway.  But someone shold maybe take a better look.


-- 
Cristian
