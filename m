From: Yu-Ting Kao <jackzzjack@gmail.com>
Date: Thu, 10 Nov 2016 14:09:56 +0800
Subject: [Buildroot] [Question] Downgrade package application.
In-Reply-To: <b2dcf634-f51a-a1a1-1243-f9f3d5a3a712@gmail.com>
References: <CADZ=QZmHuyjuctpfxNLn_up=41HXc_8Y+BtDx+4EScrRda04QA@mail.gmail.com>
 <b2dcf634-f51a-a1a1-1243-f9f3d5a3a712@gmail.com>
Message-ID: <CADZ=QZk9VgcJLKqP5U0-tunramAJ3T7YYMOitONfeQfpxK9hsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for all you help

2016-11-09 18:54 GMT+08:00 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>:
> Dear Yu-Ting Kao,
>
> i'm not sure i full understand, but:
>
> First try to apply your patch on the current Buildroot tree, chances are
> that it will apply. If it won't apply, it's always better to try to fix
> the patch against the current version than using an old one.
>
> If it's too complicated to fix the patch, as a final resolution, you can
> either:
> a) download an old tarball from https://buildroot.org/downloads/
> or
> b) clone the Buildroot git repository and use `git checkout <old git
> hash value>' to go back in time.
>
> For both of the options the best is if you know the version the patch
> was created for (for example if you know when the patch was created, you
> can use a version from that time or a bit earlier)
>
>
> Good luck,
>
> Zoltan Gyarmati
> https://zgyarmati.de
>
> On 11/09/2016 11:04 AM, Yu-Ting Kao wrote:
>> Hi,
>>
>> I have a patch for new feature on a package, but it works on lower
>> version. How can I build lower version in buildroot ? Are there any
>> menuconfig I can choose ?
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
