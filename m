From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Nov 2014 09:27:08 +0100
Subject: [Buildroot] [PATCH v3] Add a defconfig for MIPS Creator CI20
In-Reply-To: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 28 Nov 2014 16:43:29 +0000")
References: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87wq6ejtsz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > MIPS Creator CI20 is a Linux and Android development system from
 > MIPS/Imagination Technologies. It incorporates an Ingenic JZ4780 SoC
 > which includes a 1.2GHz dual core MIPS32 processor and Imagination
 > PowerVR SGX540 GPU.

 > More information can be found at:
 >   http://elinux.org/MIPS_Creator_CI20

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to next, thanks.

I do have one question though:

> +# system
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="3.0.8"
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Is mdev in any way required? We normally only enable the basic stuff
needed to get a booting system in the defconfigs.

-- 
Bye, Peter Korsgaard 
