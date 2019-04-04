From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 08:48:12 +0200
Subject: [Buildroot] [PATCH 0/2] [AUTOBUILD] Store package files list in
 results (branch yem/files-list)
In-Reply-To: <20190403213012.GC2659@scaer>
References: <cover.1554054435.git.yann.morin.1998@free.fr>
 <20190403231356.77a41b10@windsurf> <20190403213012.GC2659@scaer>
Message-ID: <20190404084812.55d33ee3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Apr 2019 23:30:12 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I would expect those files to be of about the same size as the build.log
> snippet we keep.
> 
> If it turns out to be a problem, then we can restrict that to only failed
> builds.

It is true that for failed builds, not much of the information we keep
is interesting. Perhaps just the .config/defconfig are interesting. The
build.log and other files are mainly useful to investigate issues.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
