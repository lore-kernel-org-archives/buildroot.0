From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:47:03 +0100
Subject: [Buildroot] [PATCH v2] zbar: bump version to 0.22
In-Reply-To: <20190306203551.27811-1-ps.report@gmx.net>
References: <20190306203551.27811-1-ps.report@gmx.net>
Message-ID: <20190307214703.27fcbcab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Wed,  6 Mar 2019 21:35:51 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - change from git download to official release and
>   download site (drop need for autoreconf)
> 
> - drop dependency on kernel headers >= 3.17 (should
>   be fixed with commit 'v4l2: make ZBar build and run on
>   Kernels < 3.16' (see [1])

Should this removal of the headers >= 3.17 dependency also be
propagated to BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR ?

Commit dd08ca7aa98209222a077d1db97323bbc3b563b2, which added the
headers >= 3.17 dependency to zbar, propagated this dependency to
gst-plugins-bad.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
