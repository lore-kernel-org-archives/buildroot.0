From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Mar 2018 11:12:03 -0500
Subject: [Buildroot] [PATCH v5 0/5] gobject-introspection: new series
In-Reply-To: <20180318190131.21404-1-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
Message-ID: <CANQCQpbBdXSSmZ-9HEbFP7FHj4N=J1+W5wwEFyuGDy9ZtjE_vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Sun, Mar 18, 2018 at 2:01 PM, Adam Duskett <aduskett@gmail.com> wrote:
>
> For official submission to mainline Buildroot:
>
> This new series has the following upgrades:
>   - It now works on all architectures supported by qemu-host.
>   - Gstreamer1 can now compile gir files properly. (for real this time).
>   - General makefile cleanups.
>   - New patches that make cross-compiling a bit nicer (thanks, yocto!)

Suggest updating those patches to all have links to upstream
submissions as the string provided with the "Upstream: " comment in
the description of the patch.

>   - Removed a patch that was yocto specific and not needed with buildroot.
>   - Added a PKG_GIR_EXTRA_LIBS variable in pkg-autotools.mk

Should the pkg-autotools.mk changes for this option, be a separate
patch added before the others that use it?

Matt
