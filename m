From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 13:34:28 +0200
Subject: [Buildroot] [PATCH] fix broken path in arm_toolchain_defconfig
In-Reply-To: <AANLkTikVbjYf9S-NaAT2Op_js9h00nnH020Y-NHTJ7Wc@mail.gmail.com>
References: <AANLkTikVbjYf9S-NaAT2Op_js9h00nnH020Y-NHTJ7Wc@mail.gmail.com>
Message-ID: <20100519133428.164d6234@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 May 2010 16:12:05 +0800
Chih-Min Chao <cmchao@gmail.com> wrote:

> The path of device_table.txt in arm_toolchain_defconfig is broken.
> The patch fix it and use target/generic/device_table.txt as default setting

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

You forgot the Signed-off-by line in the commit log, however.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
