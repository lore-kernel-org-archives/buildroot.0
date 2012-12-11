From: Ted Wood <ted@fgh.co.uk>
Date: Tue, 11 Dec 2012 14:28:49 -0000
Subject: [Buildroot] (no subject)
In-Reply-To: <NDBBKLDECLOIHFJKBINAAEGDFPAA.Berns@BEKA-Elektronik.de>
References: <000301cdd7a8$adeab490$09c01db0$@co.uk>
 <NDBBKLDECLOIHFJKBINAAEGDFPAA.Berns@BEKA-Elektronik.de>
Message-ID: <001d01cdd7ab$d728d7d0$857a8770$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Hi Ted,
>
>I had a simular problem with Ubuntu 12.04.
>When I chance the settings to gcc 4.5.x it works for me.
>
>Regards
>
>Rainer
>>-----Original Message-----
>>From: buildroot-bounces at busybox.net
[mailto:buildroot-bounces at busybox.net]On
>>Behalf Of Ted Wood
>>Sent: Tuesday, December 11, 2012 3:06 PM
>>To: buildroot at uclibc.org
>>Subject: [Buildroot] (no subject)
>>
>>
>>We're completely new to Embedded Linux, and were hoping to use Buildroot
as the basis for a new project.
>>
>>I'm using the November 2012 release.
>>
>>I'm trying to build for an i586 using the internal toolchain. The make
fails with the error "It appears you have defined _FILE_OFFSET_BITS=64.
>>Unfortunately uLibc was built without large file support"
>>
>>I'm pretty sure I didn't request that when I was doing menuconfig. Web
search suggests that this problem has occurred elsewhere.
>>
>>
>>Anything you can suggest?


Thanks Rainer, that seems to have fixed it - I'm using Ubuntu 12.04 too.

Apologies for double posting and accidental work related stuff in one of
them.

T
