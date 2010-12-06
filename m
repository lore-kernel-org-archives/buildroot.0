From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 00:07:59 +0100
Subject: [Buildroot] [PATCH 0/5] toolchain rework, part 1
In-Reply-To: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
References: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20101207000759.42974a61@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Dec 2010 16:40:06 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> This is the first batch of patches for the internal toolchain rework.
> 
> In this first stage we convert gmp, mpfr and mpc to proper packages and
> hook them up for use in the current toolchain.
> 
> We also fix a small bug in the package infra with regards to versioned patches
> that'll be required to avoid duplication in the binutils/gcc migration.

I have reviewed these patches, and tested that I could build
successfully an ARM toolchain, and a native ARM toolchain for the
target. The ARM cross-compiling toolchain was used to compile a
complete DirectFB+Gtk stack. The native toolchain on the target was
used to compile a simple hello world program, that I could execute.

Therefore, since I have also reviewed those changes, they all get my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
