From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Oct 2014 20:22:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
 <87wq7p57i0.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3D1CF411C49EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in 
news:87wq7p57i0.fsf at dell.be.48ers.dk:

> Is there any real reason to use uClibc with kodi?

Hi,

yes, I am using kodi on an uClibc-based system (www.fli4l.de) and it works 
perfectly fine.

According to the commit log the patch I found was made to support systemd 209 
with uClibc, not xbmc/kodi ;)
https://github.com/openembedded/oe-
core/commit/ef0adae63b4b9689c25ed7d84f2b09575c81ce83

Regards, Bernd
