From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 21 Nov 2012 09:23:11 +0000
Subject: [Buildroot] [git commit] lcdproc: fix autobuilder failures
In-Reply-To: <20121116113343.15dd3eb3@skate>
References: <20121115230738.33E869A031@busybox.osuosl.org>
 <20121116004452.635cf645@skate>
 <CAHt8ZCNQwhHyxiVy5pMtq5KJnYKS2RHm=0sOPp2VH5s7BePF3Q@mail.gmail.com>
 <20121116113343.15dd3eb3@skate>
Message-ID: <CAG2jQ8gC5zotmF=Z2W4uu89VDxaHPpdJnf=L5Fes9xU6O2gXCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 16, 2012 at 10:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Fri, 16 Nov 2012 09:07:55 +0000, Simon Dawson wrote:
>
>> If lcdproc finds freetype in the staging area, then the host header
>> and library search paths do not get added to the build commands. So I
>> think this patch does more than simply work around the problem.
>
> Ok, thanks!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi,

I don't think is fixed. I am still getting this problem in master
branch and the autobuilder reports similar problems too.

http://autobuild.buildroot.net/results/d7f51f07096a68ed5d513466ab3c1719a696cb19/build-end.log

-- 
Regards,
Markos
