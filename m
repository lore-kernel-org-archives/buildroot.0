From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 4 Jun 2007 17:44:10 +0200
Subject: [Buildroot] Soft float toolchain on ARM
In-Reply-To: <000601c7a6ba$0bd959b0$016efea9@SDW>
References: <46631CAE.4090305@lambsys.com> <000601c7a6ba$0bd959b0$016efea9@SDW>
Message-ID: <20070604154410.GA27664@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 04, 2007 at 11:07:19AM -0400, Stuart Wood wrote:
>Dave, 
>
>Our systems are running
>
>GCC 3.4.6
>binutils 2.16.1
>uClibc 0.9.29
>
>My understanding is that soft floating-point is broken in the gcc 4 series.

My understanding is that there is a fixed-point branch, unless you want
to revive libfloat (which is not the way to go, imo). I do have an FPU, but patches are welcome..
