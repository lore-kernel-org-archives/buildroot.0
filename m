From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:28:39 +0100
Subject: [Buildroot] [PATCH 06/11] support/scripts/pkg-stats: store
 licences of package
In-Reply-To: <20200103151849.10956-7-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-7-heiko.thiery@gmail.com>
Message-ID: <20200103162839.3d9ab57c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 16:18:43 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Just curious: how does this gets used in your statistics site ? I see
that you show whether the package has a license or not, but I don't see
the license details being exposed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
