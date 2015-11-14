From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 23:40:26 +0100
Subject: [Buildroot] [PATCH/next
 09/13]	package/x11r7/xserver_xorg-server: add version 1.18.0
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
 <1447457203-27816-9-git-send-email-bernd.kuhls@t-online.de>
 <878u60i5me.fsf@dell.be.48ers.dk>
Message-ID: <qrpkhcx89o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 14 Nov 2015 23:22:01 +0100 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <bernd.kuhls@t-online.de> writes:
> 
>  > Video drivers need ABI version 20 now:
>  > http://cgit.freedesktop.org/xorg/xserver/commit/?
id=a8a0f6464a33c12c1de495d74fd478c0d952643e
> 
> Is there any sense in keeping the v1.17 series around? I would prefer to
> not have to support 3 versions.

Hi Peter,

nvidia-driver depends on ABI 19 (yes, I will send a patch in the next 
minutes, I do not use Nvidia hardware so i forgot about it), it is broken 
with X.org 1.18.0:

http://www.phoronix.com/scan.php?page=news_item&px=x.org-server-1.18-
video-abi

ftp://download.nvidia.com/XFree86/Linux-x86/358.09/README/
minimumrequirements.html

https://www.archlinux.org/news/xorg-1180-enters-testing/

Regards, Bernd
