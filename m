From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Jun 2015 19:45:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Adjust libnsl detection
	to include musl
References: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
 <20150412185443.08512d17@free-electrons.com>
Message-ID: <XnsA4C9C8FD8F85BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150412185443.08512d17 at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Sun, 12 Apr 2015 16:21:46 +0200, Bernd Kuhls wrote:
>> Only (e)glibc provides libnsl, uclibc provides only a stub
> 
> True, but uClibc provides the functionality, no? Or is the stub
> actually not working at runtime? Could you be a bit more specific here?

Hi,

http://git.uclibc.org/uClibc/tree/libnsl/nsl.c

Uclibc provides only stub code, libnsl has no functionality there ;)

Regards, Bernd
