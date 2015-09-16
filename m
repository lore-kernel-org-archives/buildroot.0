From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 16 Sep 2015 18:56:30 +0200
Subject: [Buildroot] [PATCH v2 0/1] package/freeswitch: new package
References: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
 <20150911114016.GX8475@waldemar-brodkorb.de>
Message-ID: <uijoccxlig.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 11 Sep 2015 13:40:16 +0200 schrieb Waldemar Brodkorb:

> Could you try with this patch:
> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0
> 
> It allows to compile the code in awgn.c for me.
> I don't know the reason why the change was made. Reverting the commit
> makes the tgmath.h file matching GNU libc code.

Hi Waldemar,

thanks, this patch fixes the compile problem:
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?
h=1.0&id=5a167e319ca2bee566d330d1c901d76dc53deea7

Regards, Bernd
