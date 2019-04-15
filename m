From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 23:18:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/openjdk: only support a single
 variant at a time
In-Reply-To: <20190415211428.25961-2-aduskett@gmail.com>
References: <20190415211428.25961-1-aduskett@gmail.com>
 <20190415211428.25961-2-aduskett@gmail.com>
Message-ID: <20190415231832.40bac33e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 17:14:28 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Selecting multiple variants doesn't seem to be that important in the context of
> Buildroot. This patch removes the ability to select multiple variants in favor
> of just selecting one.
> 
> The default is server as that is what all of the major distributions currently
> use as the default as well.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a45cfa9b3602fd05f6adbf070a1bad6510975c36/build-end.log

Ideally this commit log should have explained that enabling the zero
variant cannot be done together with enabling the client or server
variant, but expressing that with Config.in dependencies was deemed too
complicated.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
