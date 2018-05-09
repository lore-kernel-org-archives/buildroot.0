From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 10:56:52 +0200
Subject: [Buildroot] [PATCH 1/1] log4cplus: bump to version 2.0.0
In-Reply-To: <20180506093507.24850-1-fontaine.fabrice@gmail.com>
References: <20180506093507.24850-1-fontaine.fabrice@gmail.com>
Message-ID: <20180509105652.3f6fcea1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun,  6 May 2018 11:35:07 +0200, Fabrice Fontaine wrote:
> - LICENSE has been updated to add threadpool license (BSD-like)
> - Add hash for license file
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a4690fd3e46354776f6d6addd17226622c5f4961
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Causes new build failures:

  http://autobuild.buildroot.net/?reason=log4cplus-2.0.0

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
