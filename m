From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 14:33:32 +0100
Subject: [Buildroot] toolchain into the root disk
In-Reply-To: <AANLkTi=tEiD9=biree-6EzC5qN_6ZL0r=tyhC0WPtpm1@mail.gmail.com>
References: <AANLkTi=tEiD9=biree-6EzC5qN_6ZL0r=tyhC0WPtpm1@mail.gmail.com>
Message-ID: <20110307143332.3afe2773@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Mar 2011 16:47:42 +0000
Max <themaxmail@gmail.com> wrote:

> Is there any way to setup builroot to insert a toolchain into the
> root disk?

See the BR2_PACKAGE_GCC_TARGET option, which allows to enable toolchain
in the target.

However, remember that Buildroot is a *cross-compilation* build system:
its purpose is to cross-compile libraries and programs for the target.
Therefore, the target toolchain (which allows to do native compilation
on the target) is not that widely used, and therefore not that widely
tested.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
