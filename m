From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 13:06:39 +0100
Subject: [Buildroot] [PATCH] package/sqlcipher: add OpenSSL 1.1.x
 compatibility
In-Reply-To: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190211130639.2d5c16a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Wed,  6 Feb 2019 06:09:18 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes
> http://autobuild.buildroot.net/results/5e2/5e2c3178d8a6e11b1af1c37144737097730ba222/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Tested using autobuilder failure setup for libopenssl.

Applied to master, thanks. Please remember to use "git format-patch -N"
to format the patches, this removes the numbering inside the patch
titles.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
