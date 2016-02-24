From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 24 Feb 2016 14:56:18 -0500
Subject: [Buildroot] Confusion about location of custom Linux patches
Message-ID: <CAF_dkJA2VYCaAMTY=D3zsdV6YcAa1FS2w+8A2ygqrCuqQFWfCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the documentation in section 9.8:

"The exception to BR2_GLOBAL_PATCH_DIR being the preferred method for
specifying custom patches is BR2_LINUX_KERNEL_PATCH."

But later, in section 9.10, it says:

"Specifically for the Linux kernel, there also exists the option
BR2_LINUX_KERNEL_PATCH with as main advantage that it can also
download patches from a URL. If you do not need this,
BR2_GLOBAL_PATCH_DIR is preferred."

I tried deciding that BR2_GLOBAL_PATCH_DIR was preferred, but now I'm
not sure how to name the subdirectory inside BR2_GLOBAL_PATCH_DIR.  I
have tried $BR2_GLOBAL_PATCH_DIR/kernel and
$BR2_GLOBAL_PATCH_DIR/linux, and neither has seemed to work.

So now I'm just gonna ask...

I am building outside the buildroot tree in a custom tree.  I have
kernel patches that I need to apply (until such time as they get
folded into the kernel).  Where is the best place to place them and
how should that directory be named?

--wpd
