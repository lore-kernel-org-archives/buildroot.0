From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:35:15 +0100
Subject: [Buildroot] [PATCH/next 1/4] package/python-gitdb2: new package
In-Reply-To: <20191129212910.2537303-1-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
Message-ID: <20191216233515.657770ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Nov 2019 13:29:07 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> GitDB allows you to access bare git repositories for reading and writing.
> It aims at allowing full access to loose objects as well as packs with
> performance and scalability in mind. It operates exclusively on streams,
> allowing to handle large objects with a small memory footprint.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied, with one change. See below.

> +PYTHON_GITDB2_LICENSE = Sebastian Thiel and contributors

This clearly isn't a license. The license is BSD-3-Clause, as a quick
inspection to the LICENSE file reveals. I fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
