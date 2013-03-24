From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:45:46 +0100
Subject: [Buildroot] [PATCH v2] oprofile 0.9.8: fix compilation on
 powerpc
In-Reply-To: <925a76f808cf62f15265.1363892597@BEANTN0L019720>
References: <925a76f808cf62f15265.1363892597@BEANTN0L019720>
Message-ID: <20130324094546.23b4c5da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 21 Mar 2013 20:03:17 +0100, Thomas De Schampheleire wrote:
> The oprofile build was broken on powerpc since version 0.9.8.
> This was detected in several autobuilds, like
> http://autobuild.buildroot.net/results/6f6c02d18495907d50fcdfc6003ac20d493c55fe/
> 
> Thomas Petazzoni had some fixes pending in his own tree, and this patch is
> partially based on this work (credits to him). Here is an overview:
> - I took over (and fixed) the oprofile.mk changes, except for the powerpc-
>   specific part. For powerpc, there is a new dependency to libpfm4.
> - I reimported those Yocto patches that were specific to the ppc build
>   issues, but left out the other ones. Those can be added in separate
>   commits.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
