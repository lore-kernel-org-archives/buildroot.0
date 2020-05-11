From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 May 2020 00:01:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-05-02
In-Reply-To: <5eae6423.1c69fb81.fdbb7.98fdSMTPIN_ADDED_MISSING@mx.google.com>
References: <5eae6423.1c69fb81.fdbb7.98fdSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <d78081bf-cf99-53d2-ebce-6a06adc00d73@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 03/05/2020 ? 08:26, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Recent build failures and runtime-tests failures
> ================================================
> 
> This is the list of Buildroot build failures that occurred on
> 2020-05-02, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arm      |         mesa3d-20.0.6          | http://autobuild.buildroot.net/results/f7aa81616e2306b585d9fc9b1d0515df79c75db5
> 
> 
> Build failures related to your defconfigs:
> 
>                         defconfig |                        link to the job                       
> ----------------------------------+--------------------------------------------------------------
>              qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054523 

It would be great if this patch series can be reviewed to fixes
optee/python-pycrypto packages:
http://patchwork.ozlabs.org/project/buildroot/list/?series=172819

Best regards,
Romain
