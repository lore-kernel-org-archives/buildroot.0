From: Pawel Sikora <sikor6@gmail.com>
Date: Fri,  7 Apr 2017 01:41:38 +0200
Subject: [Buildroot] [PATCH 0/1] xenomai: Add choice for Cobalt/Mercury core
Message-ID: <20170406234139.31532-1-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe this is not completely an 'choice' option, because it depends
on enabled/disabled option for Linux Kernel extentions and 
this will be always just one option in each configuration...

But choice menu is quite readable in this case so that's why I used it.

I've been thinking first to let the user decide to have Mercury
or Cobalt even if one would have I-Pipe patch for the Linux Kernel,
but then, what is the purpose of using Mercury if you have patched Kernel?

If we would like to let users decide anyway, then form of the patch will
change and most probably the 'choice' style will be dropped because it's
not possible to select option in 'choice' menu from some other config?

Let me know what do you think about this approach and if you have any comments.

Regards,
Pawel

Pawel Sikora (1):
  xenomai: Add choice for Cobalt/Mercury core

 package/xenomai/Config.in  | 30 ++++++++++++++++++++++++++++++
 package/xenomai/xenomai.mk |  4 ++++
 2 files changed, 34 insertions(+)

-- 
2.12.1
