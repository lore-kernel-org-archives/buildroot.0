From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 13:20:42 +0100
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: add
 support for running parallel builds
In-Reply-To: <20191203165450.1100336-1-thomas.petazzoni@bootlin.com>
References: <20191203165450.1100336-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191204132042.1d3783d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 17:54:50 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> When BR2_PER_PACKAGE_DIRECTORIES=y in the generated configuration, we
> then use top-level parallel build on 50% of the builds. This will
> allow to give some testing exposure to this new functionality.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  scripts/autobuild-run | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Applied to buildroot-test. Of course, for now, it won't do anything
until utils/genrandconfig in Buildroot is patched to use
BR2_PER_PACKAGE_DIRECTORIES=y.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
