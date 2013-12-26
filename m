From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 16:57:50 +0100
Subject: [Buildroot] buildroot_defconfig Error
In-Reply-To: <CAO8ZbKt9uYRyRutgkMYFS4hY=EYASWEeyEXha4-q+9C6dmDMCw@mail.gmail.com>
References: <CAO8ZbKt9uYRyRutgkMYFS4hY=EYASWEeyEXha4-q+9C6dmDMCw@mail.gmail.com>
Message-ID: <20131226165750.58140cf0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ron Eggler,

On Thu, 26 Dec 2013 15:50:06 +0000, Ron Eggler wrote:

> cp: cannot stat ?board/synapse/e10/linux-3.12.1-config?: No such file or
> directory

Please read this error message. It is pretty clearly telling you that
the kernel configuration file you provided does not exist.

Fix the value of your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
