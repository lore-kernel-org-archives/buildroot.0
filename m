From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Oct 2014 01:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
In-Reply-To: <XnsA3D1CF411C49EberndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Sat, 25 Oct 2014 20:22:26 +0200")
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
 <87wq7p57i0.fsf@dell.be.48ers.dk>
 <XnsA3D1CF411C49EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <874mur908x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Peter Korsgaard <jacmet@uclibc.org> wrote in 
 > news:87wq7p57i0.fsf at dell.be.48ers.dk:

 >> Is there any real reason to use uClibc with kodi?

 > Hi,

 > yes, I am using kodi on an uClibc-based system (www.fli4l.de) and it works 
 > perfectly fine.

I'm not questioning if it is possible given enough patches, but rather
if it is worth the effort. Is there any specific reason why you are
using uClibc instead of musl or glibc?

-- 
Bye, Peter Korsgaard
