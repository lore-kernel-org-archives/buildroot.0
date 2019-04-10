From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:05:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/llvm: bump to 8.0.0
In-Reply-To: <20190409060723.1654-1-valentinkorenblit@gmail.com>
References: <20190409060723.1654-1-valentinkorenblit@gmail.com>
Message-ID: <20190410190532.5d8f890f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Tue,  9 Apr 2019 08:07:22 +0200
Valentin Korenblit <valentinkorenblit@gmail.com> wrote:

> The license file hash changed due to a copyright year update:
> 
> -Copyright (c) 2003-2018 University of Illinois at Urbana-Champaign.
> +Copyright (c) 2003-2019 University of Illinois at Urbana-Champaign.
> 
> Changes v1 -> v2:
> 	- Add comment about changes in license file

The changelog should not be part of the commit log itself. It should go...

> 
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---

... here, so that it gets dropped when the patch is applied.

I've dropped the changelog from the commit log of both patches and
applied them to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
