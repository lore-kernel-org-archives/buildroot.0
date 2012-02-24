From: =?UTF-8?Q?=C3=89ric_ALBER?= <eric.alber@gmail.com>
Date: Fri, 24 Feb 2012 16:03:54 +0100
Subject: [Buildroot] Microperl compilation error
In-Reply-To: <4F43FB16.3080503@gmail.com>
References: <CAGDZK6GbRLiJMT+4dpGWQbQYrc_W5djWR-k-ciK+v-HyG8=q0g@mail.gmail.com>
 <4F43FB16.3080503@gmail.com>
Message-ID: <CAGDZK6HfVtAH89ax=8Qh=-8b-FESzK2VW2=08QDB9nmYSjnizQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/2/21 Steve Calfee <stevecalfee@gmail.com>

> On 02/21/2012 02:51 AM, ?ric ALBER wrote:
>
>> Hello,
>>
>> I'm using buildroot to install a custom linux on a Seagate Dockstar
>> (Marvell Kirkwood based product).
>>
>>  Hi Eric,
>
> I am also doing some stuff with a Dockstar and buildroot. Have you built
> u-boot for it? Will you share your .configs for buildroot, kernel and
> u-boot with the buildroot list?
>
> Thanks, Steve
>

I use the u-boot setup made by Jeff Doozan:
http://jeff.doozan.com/debian/uboot/ and I'm happy with it, so I don't
rebuild my own u-boot.

For buildroot, linux kernel, uClibc and busybox config files, you can find
them in this repository:
https://bitbucket.org/bhteam/bhware-open/src/10abca90ab12/drunkstar
It's in a very "work in progress" state, that's why you find buildroot
2010.08 related files in this directory. The interresting files for you are:
buildroot-2012.02.config<https://bitbucket.org/bhteam/bhware-open/src/10abca90ab12/drunkstar/buildroot-2012.02.config>
linux-3.2.6.config<https://bitbucket.org/bhteam/bhware-open/src/10abca90ab12/drunkstar/linux-3.2.6.config>
uclibc-0.9.31.1.config<https://bitbucket.org/bhteam/bhware-open/src/10abca90ab12/drunkstar/uclibc-0.9.31.1.config>
busybox-1.19.4.config<https://bitbucket.org/bhteam/bhware-open/src/10abca90ab12/drunkstar/busybox-1.19.4.config>

The two last ones (uclibc and busybox) are almost unchanged default
versions.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120224/8f28bbd8/attachment-0001.html>
