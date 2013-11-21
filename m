From: Freedreamer <freedreamer@email.it>
Date: Thu, 21 Nov 2013 15:27:03 +0100
Subject: [Buildroot] Buildroot and Git repository (u-boot + kernel)
In-Reply-To: <528DCD63.4060601@mind.be>
References: <CAAs3wMgyCOV_oeTjL0GFTAux9tPsZXeEifTgACSqKcPQSN=ABg@mail.gmail.com>
 <20131120135421.0602e149@skate>
 <CAAs3wMiTfo8tiLmgCGH9G_fz+zvmAO6YdhvgVpVm28gaOHtBjg@mail.gmail.com>
 <528D3795.1050601@mind.be>
 <CAAs3wMjPUqp3TBgWvteB5PO3kMN4+RarNEA9GSUUmWreJjGagg@mail.gmail.com>
 <528DCD63.4060601@mind.be>
Message-ID: <CAAs3wMgaKe0YxN6ENXs_tUof8+jF3ShJ9VKXW7TANKjNfh2xoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks , I got it.

best regards


2013/11/21 Arnout Vandecappelle <arnout@mind.be>

> On 21/11/13 09:31, Freedreamer wrote:
>
>> Here the logs for uboot.
>>
>> in the folder uboot If i do command git branch I always got *master ad
>> not branch i want.
>>
>
>  Okay... So actually everything is working perfectly.
>
>  The uboot directory is part of buildroot, not of u-boot. Your buildroot
> is still at the master branch.
>
>  The only way to be really certain that buildroot checked out the right
> branch is to compare the contents of output/build/uboot-* with the contents
> of your u-boot git repository.
>
>  But since you configure u-boot for spear320_h2ad which is not in upstream
> u-boot, and that succeeds, I guess you're using the correct branch...
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131121/bc7a27b8/attachment.html>
