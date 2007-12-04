From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Tue, 04 Dec 2007 10:43:26 +0100
Subject: [Buildroot] Kernel not configuring [PowerPC 603e]
In-Reply-To: <a2be1d440712040052q32bd98d2q2570a670cc770b2b@mail.gmail.com>
References: <a2be1d440712040019x45aa8fbfp5079d3077e30abf8@mail.gmail.com>	<4ac2955e0712040031w3217e3b3s9733b271e246e671@mail.gmail.com>
	<a2be1d440712040052q32bd98d2q2570a670cc770b2b@mail.gmail.com>
Message-ID: <4755213E.7080800@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Andrea Provasi ha scritto:
> For all of them I'd like to build a Kernel and root filesystem and I 
> wonder how to differentiate te
> .config for the different kernels.

Hi Andrea,

you can use make saveconfig and make BOARD=xxx getconfig to save and get 
the configuration set (kernel/uclibc/busybox) into the local/$(BOARD) 
subdirectory. I think you also have to specify the correct board name 
into the right menuconfig entry.

Regards,

ing. Federico Fuga

>
> Cheers
> Andy
>
