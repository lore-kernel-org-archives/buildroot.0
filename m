From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 01 Feb 2016 18:45:34 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 <87mvrkcsvm.fsf@dell.be.48ers.dk>
Message-ID: <u6i4ocx4ug.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 01 Feb 2016 17:11:57 +0100 schrieb Peter Korsgaard:

> I now spent some quality time (!) with gettext.m4 and figured out what
> we really going on here with musl and libintl.h, and I've pushed a
> simpler / more complete patch fixing the issue.

Hi Peter,

thanks, the code looks good, usr/include/libintl.h is not overwritten by 
gettext anymore, my dos2unix testcase works!

Regards, Bernd
