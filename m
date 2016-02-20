From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 14:49:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add optional
	support for bzip2
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
 <56BBA94B.3000809@mind.be>
Message-ID: <sg7mpcxlr5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 10 Feb 2016 22:19:07 +0100 schrieb Arnout Vandecappelle:

>  No --with-bz2lib? If there is a good reason, mention it in the commit
>  log.

Hi Arnout,

libarchive always checks for bzip2 unless --without-bz2lib is used:
https://github.com/libarchive/libarchive/blob/master/configure.ac#L300

Therefore I see no need for --with-bz2lib and I also should not have 
added --with-lzma as well, I will send a patch removing it along with v2 
of this patch explaining why --with-bz2lib is not needed.

Regards, Bernd
