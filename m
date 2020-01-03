From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:24:56 +0100
Subject: [Buildroot] [PATCH 04/11] support/scripts/pkg-stats: do not
 exclued pkg name in json output
In-Reply-To: <20200103151849.10956-5-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-5-heiko.thiery@gmail.com>
Message-ID: <20200103162456.4167ad5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 16:18:41 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

But isn't the package name already present in
http://autobuild.buildroot.net/stats/index.json ? All the subnodes of
/packages/ are nodes named after the packages.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
