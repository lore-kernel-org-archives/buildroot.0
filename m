From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 9 Jun 2011 08:55:33 -0700
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <BANLkTinzono1kmGg_pL2bVMfHg1qyN6sMg@mail.gmail.com>
References: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
	<4DEFF7EA.6080701@gmail.com>
	<BANLkTinzono1kmGg_pL2bVMfHg1qyN6sMg@mail.gmail.com>
Message-ID: <BANLkTimZfF1WmxH14PEn+kRsPYzs6P8cGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/9 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>
> BR2_ROOTFS_POST_BUILD_SCRIPT is run before image creation, not after
> (so you can change the rootfs before it is packaged). So I don't think
> it is the right solution.
>
> Best regards,
> Bj?rn Forsman
>

OK, I see. When I build and want to extract to nfs etc, I put my
buildroot make inside a shell script, if it returns success I then do
the unpacking and copying (uImage).

Steve
