From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:16:56 +0100
Subject: [Buildroot] [PATCH v1] docs/manual/quickstart: Update output
 directory contents documentation.
In-Reply-To: <20191118164217.14022-1-michael.drake@codethink.co.uk>
References: <20191118164217.14022-1-michael.drake@codethink.co.uk>
Message-ID: <20191118211656.2d88b140@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Nov 2019 16:42:17 +0000
Michael Drake <michael.drake@codethink.co.uk> wrote:

> Updated the documentation for the output/host/ directory to mention
> that it contains the sysroot for the target toolchain, as well as the
> host tools required for running buildroot.
> 
> Updated the staging/ documentation to reflect that it is a link to
> the target toolchain sysroot in the host/ directory.
> 
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> ---
>  docs/manual/quickstart.txt | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
