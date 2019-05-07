From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 May 2019 22:56:25 +0200
Subject: [Buildroot] [PATCH 1/2] allow build infrastructure to pick up
 installed meson tool
In-Reply-To: <20190503185721.18b2c3a4@gmx.net>
References: <20190503131851.12315-1-norbert.lange@andritz.com>
 <20190503185721.18b2c3a4@gmx.net>
Message-ID: <20190507225625.31f5c8d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 May 2019 18:57:21 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> The major concern is no distribution will ship meson with the still needed
> buildroot patch, see [4]...

Indeed, that makes it impractical/impossible to use a system-provided
meson. If we want to get there at some point, the
0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch patch needs to
be upstreamed in a form or another.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
