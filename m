From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 08:45:37 +0100
Subject: [Buildroot] [PATCH v2] package/fswebcam: bump to latest git
 version
In-Reply-To: <8c1da465-2f2c-028d-788a-9eceab1cc5d3@microchip.com>
References: <20200224074146.3008-1-eugen.hristev@microchip.com>
 <20200226213801.64454e3c@windsurf>
 <8c1da465-2f2c-028d-788a-9eceab1cc5d3@microchip.com>
Message-ID: <20200227084537.3ed2c1a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Thu, 27 Feb 2020 07:10:35 +0000
<Eugen.Hristev@microchip.com> wrote:

> > You forgot to remove the hash of the old tarball here. So I dropped
> > this, and applied your patch to our next branch. Thanks!  
> 
> Thanks as well. I intentionally left it there. I am unsure about the 
> policy of keeping old hashes there. So I preferred not to touch it.

Old hashes would be dead code, so we drop them. They are anyway
available in the Git history should anyone need them in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
