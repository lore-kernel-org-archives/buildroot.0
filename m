From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:43:52 +0200
Subject: [Buildroot] [PATCH v2] package/librtlsdr: bump to last commit
In-Reply-To: <20200810191149.64db872c@x230_1.trabucayre.com>
References: <20200727163039.15873-1-gwenj@trabucayre.com>
 <20200808174715.4f9f0875@windsurf.home>
 <20200810191149.64db872c@x230_1.trabucayre.com>
Message-ID: <20200811234352.186ac2aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 19:11:49 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> Build issue with dump1090 is fixed by
> http://patchwork.ozlabs.org/project/buildroot/patch/20200809093538.126676-1-titouan.christophe at railnova.eu/
> 
> For librtlsdr itself: I have tried all build failure but unable to
> reproduce this issue (tested with docker image provided by buildroot).

You probably only tested with an in-tree build. The issue only occurred
with out of tree builds. I have submitted a patch that fixes it, you
are in Cc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
