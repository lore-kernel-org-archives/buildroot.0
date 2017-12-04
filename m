From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 4 Dec 2017 10:13:39 +0530
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
In-Reply-To: <20171203225110.319cc00e@windsurf.home>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <20171203225110.319cc00e@windsurf.home>
Message-ID: <CAMty3ZDHvYQsnR4gJhZ2XWPdcexZ0DV_f36pEW9Z7d9kcufLug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 4, 2017 at 3:21 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  1 Nov 2017 19:05:42 +0100, Jagan Teki wrote:
>
>> Jagan Teki (11):
>>   arm-trusted-firmware: Build FIP for BL33
>>   uboot: Add U-Boot-bundles-ATF support
>
> Since I was not super happy with this proposal to solve the ATF/U-Boot
> building problem for Allwinner A64/H5, I just submitted a different
> patch series (which re-uses some of your work, authorship preserved).
> Could you see what you think about my proposal ?

Yes, this is what I proposed in previous versions[1], unfortunately ie
not moving further. Happy that now it has better shape to move.

>
> See:
>
>  http://lists.busybox.net/pipermail/buildroot/2017-December/208788.html
>
>>   board: Add Bananapi M64 support
>>   board: Add Pine64 support
>>   board: Add SoPine support
>>   board: Add FriendlyARM Nanopi A64 support
>>   board: Add FriendlyARM Nanopi NEO2 support
>>   board: Add Olimex A64-OLinuXino support
>>   board: Add Orangepi Win/Win Plus support
>>   board: Add Orangepi Prime support
>>   board: Add Orangepi Zero Plus2 support
>
> If my proposal gets merged, then it would be nice if you could rebase
> your defconfig patches on top of it. It's mainly a matter of adding a
> few more ATF options and tweaking U-Boot options.

Yes, will do.

[1] http://patchwork.ozlabs.org/cover/833068/

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
