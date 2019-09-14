From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 14 Sep 2019 13:58:28 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-13
In-Reply-To: <20190914061259.9228385CA8@hemlock.osuosl.org>
References: <20190914061259.9228385CA8@hemlock.osuosl.org>
Message-ID: <20190914105828.GA10015@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...

> Detail of defconfig failures
> ----------------------------
> 
>                         defconfig |                        link to the job                        | orph?
> ----------------------------------+---------------------------------------------------------------+------
>                       aarch64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472925  |      
>        acmesystems_aria_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472926  |      
>        acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472927  |      

...

>                     orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473046  |      
>                    orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473045  |      
>                      orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473048  |      
>                 orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473050  |      
>                       orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473053  |      
>                      orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473052  |      
>                  orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473055  |      
>                     orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473056  |      
>                    orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473057  |      
>                       orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473058  |      
>                      orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473059  |      
>                     orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473060  |      
>               orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473061  |      
>                        pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473063  |      
>                    pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473064  |      
>                     pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473066  |      
>                            pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473067  |      
>                     pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473068  |      

...

>                     zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473147  |      
>                        zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473148  |      
>                          zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473149  |      
>                     zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473151  |      

Hi Thomas and all,

It looks like almost all the defconfig builds failed due to the issue
with CI infrastructure:

ERROR: Job failed (system failure): Error response from daemon:
mkdir /home/docker/aufs/mnt/56f5a829e13290f603b956812782ffb352b2d178969fa60b68cedd67ab2ec79d-init: no space left on device (executor_docker.go:743:0s)

Regards,
Sergey
