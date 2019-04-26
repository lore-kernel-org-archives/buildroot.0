From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 17:14:43 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libglib2: bump to version
 2.60.0
In-Reply-To: <20190426170751.18c6c159@windsurf>
References: <20190415225541.3002-1-aduskett@gmail.com>
 <20190426170751.18c6c159@windsurf>
Message-ID: <20190426171443.0a571d2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Apr 2019 17:07:51 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> So, apparently, it's using the --add-symbol option of objcopy, which
> doesn't exist in this ancient objcopy version:
> 
> $ objcopy --version
> GNU objcopy (GNU Binutils for Debian) 2.22

--add-symbol was added in binutils upstream by commit
2b35fb28f397a26c0da03f7579116d28af2af824, which first appeared in
binutils 2.26. So it's expected that binutils 2.22 doesn't support this
option.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
