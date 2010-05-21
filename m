From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 21 May 2010 15:12:13 +0800
Subject: [Buildroot] [PATCH] fix broken path in arm_toolchain_defconfig
In-Reply-To: <20100519133428.164d6234@surf>
References: <AANLkTikVbjYf9S-NaAT2Op_js9h00nnH020Y-NHTJ7Wc@mail.gmail.com>
	<20100519133428.164d6234@surf>
Message-ID: <AANLkTinRRSrYrySzAmiv7zEqUAW_L60IY7bgRH2ZQlHP@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 19, 2010 at 7:34 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Fri, 14 May 2010 16:12:05 +0800
> Chih-Min Chao <cmchao@gmail.com> wrote:
>
> > The path of device_table.txt in arm_toolchain_defconfig is broken.
> > The patch fix it and use target/generic/device_table.txt as default
> setting
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> You forgot the Signed-off-by line in the commit log, however.
> Thomas
>

So, should I generate the patch by "git format-patch --signoff
revision_range" ??
If the answer is yes, the attached is the reformat patch with sign-off-by
information


> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100521/43b03fe3/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-fix-device_table.txt-path-in-arm_toolchain_defconfig.patch
Type: text/x-patch
Size: 873 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100521/43b03fe3/attachment.bin>
