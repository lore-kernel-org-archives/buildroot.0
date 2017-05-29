From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:53:21 +0200
Subject: [Buildroot] [PATCH 2/2] package: xen: Depend on the host-acpica
 package
In-Reply-To: <20170524203030.8187-3-alistair.francis@xilinx.com>
References: <20170524203030.8187-1-alistair.francis@xilinx.com>
 <20170524203030.8187-3-alistair.francis@xilinx.com>
Message-ID: <20170529235321.14dc3fa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Same comment on the commit title: use "package/xen: " as a prefix.

On Wed, 24 May 2017 13:30:30 -0700, Alistair Francis wrote:
> Add a dependency on the host ACPICA package as Xen tools require iasl to
> build.

Lacks a reference to the autobuilder issue being fixed. I know you have
it in the cover letter, but this is not the place where it is useful:
the cover letter contents don't get committed/preserved anywhere. While
the commit log becomes part of the Git history. So we want to have the
autobuilder reference as part of the commit log.

>  XEN_LICENSE_FILES = COPYING
> -XEN_DEPENDENCIES = host-python
> +XEN_DEPENDENCIES = host-python host-acpica

Alphabetic ordering not respected.

I've fixed those issues and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
