From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 9 Jun 2008 10:10:50 +0200
Subject: [Buildroot] Target's /sys directory not created by buildroot
References: <6306c640806061655t6be09c97ud175dfdcf0fa82e6@mail.gmail.com>
Message-ID: <014b01c8ca0b$f32a0f10$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> hi,
>         When i see the target skeleton of the root file system in the
> directory /buildroot/generic/target_skeleton there is a /sys directory.But
> it is not created under the target root filesystem ie)
> under
> /project_build_<arch>/root/....When i give make.
> 
> There is no /sys directory inside the Target's root filesystem though it is
> present in the target_skeleton directory......
> 
> Do i have to enable any option in the menuconfig to get that directory under
> the target filesystem......????
> 
> Please suggest me.....
> 
> Regards,
> Ram
>

Your build is using another target_skeleton


Best Regards
Ulf Samuelsson 
