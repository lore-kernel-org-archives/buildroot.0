From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 29 Nov 2012 08:52:17 +0000 (UTC)
Subject: [Buildroot] no /etc/hosts error in building root
References: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
 <20121129093416.2cf28e51@skate>
Message-ID: <slrnkbe8g9.2kq.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-11-29, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>
wrote:
> Dear Woody Wu,
>
> On Thu, 29 Nov 2012 03:31:16 +0000 (UTC), Woody Wu wrote:
>
>> BTW:  If I also want the root iamges under output/images directory to be
>> regenerated, is that enough to only remobe the output/target and run
>> 'make'?  I tried something like 'make root-rebuild' and 'make
>> rootfs-rebuild' but they do not work.
>
> Just run "make". The images in output/images/ and re-generated from the
> contents of output/target at every make invocation.
>
> Thomas

This is a good news. Thanks.

-- 
woody
I can't go back to yesterday - because I was a different person then.
