From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 08:20:44 +0200
Subject: [Buildroot] Notifications of defconfig and runtime test failures
In-Reply-To: <20190907061322.CC0778821B@hemlock.osuosl.org>
References: <20190907061322.CC0778821B@hemlock.osuosl.org>
Message-ID: <20190907082044.3c46f9e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 07 Sep 2019 06:13:16 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Detail of defconfig failures
> ----------------------------
> 
>                         defconfig |                        link to the job                        | orph?
> ----------------------------------+---------------------------------------------------------------+------
>                 amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126211  |      
>                arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126214  |      
>                         bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126246  |      
>                    beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126249  | ORPH 
>         engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126255  |      
>                  imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126282  |      
>                        imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126286  |      
>                         imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126288  |      
>                     licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126292  |      
>                linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126293  |      
>                     orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126321  |      
>                    orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126320  |      
>                  orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126326  |      
>                     orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126331  |      
>               orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126332  |      
>                    pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126334  |      
>                     pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126335  |      
>                raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126382  | ORPH 
>                             warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126413  |      
>                         warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126414  | ORPH 
> 
> 
> Detail of runtime-test failures
> -------------------------------
> 
>              runtime-test |                        link to the job                        | orph?
> --------------------------+---------------------------------------------------------------+------
> ...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126471  | ORPH 
> ...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126473  | ORPH 
> ...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126475  | ORPH 
> ...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126476  | ORPH 
> ...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126477  | ORPH 
>              TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126581  | ORPH 

As you can see in this daily e-mail, we are now reporting not only
autobuilder failures, but also defconfig failures and runtime test
failures. This is another thing that was implemented by Victor Huesca
as part of his internship at Bootlin.

Just like the autobuilder failures, the defconfig and runtime test
failures are not only all reported to the mailing list, they are also
reported individually to each developer who is listed in the DEVELOPERS
file for a given defconfig or runtime test.

Hopefully this will help us keep an eye on our defconfigs and runtime
tests!

Thanks to Victor for implementing all of this !

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
