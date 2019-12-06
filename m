From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:49:25 +0100
Subject: [Buildroot] [PATCH] package/luajit: switch to moonjit fork
In-Reply-To: <20191204083845.6319-1-francois.perrad@gadz.org>
References: <20191204083845.6319-1-francois.perrad@gadz.org>
Message-ID: <20191206234925.072bca51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 09:38:45 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> this fork is based on LuaJIT 2.1.0-beta3 which supports ARM64
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for the patch! You forgot to explain in the commit log why the
hash of the license has changed. So I improved the commit log with some
explanation about this, after doing a diff between the old and new
COPYRIGHT files, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
