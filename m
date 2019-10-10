From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:07:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: needs host-flex
In-Reply-To: <20191010192501.21183-1-fontaine.fabrice@gmail.com>
References: <20191010192501.21183-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010220730.5cf993a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 21:25:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cd5deacbe6f4f97aa0bbc8040ac9aa7860ceaa6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Can we instead try to use the tarball at
https://collectd.org/files/collectd-5.9.2.tar.bz2 and hopefully drop
the dependencies on host-bison and host-flex ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
