From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Mar 2010 23:12:32 +0100
Subject: [Buildroot] [PATCH] external toolchain: fix sysroot location if
 the toolchain was	moved
In-Reply-To: <20100324224238.1489.74099.stgit@roazhon.bzh.lan>
References: <20100324224238.1489.74099.stgit@roazhon.bzh.lan>
Message-ID: <20100325231232.72490a9b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Mar 2010 23:42:42 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> Sysrooted toolchain can be relocated. In this case, the sysroot is no
> longer located at the place it was configured at.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Something like this was definitely needed. I had another implementation
in mind, but yours is nice and simple. Thanks!

Acked-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
