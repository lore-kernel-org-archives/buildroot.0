From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:09:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: bump version
 to 3.0.0
In-Reply-To: <20190528133927.30396-1-deinok@deinok.com>
References: <20190528133927.30396-1-deinok@deinok.com>
Message-ID: <20190601140952.6e301698@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Raul,

On Tue, 28 May 2019 15:39:27 +0200
deinok at deinok.com wrote:

> From: Raul Hidalgo Caballero <deinok@deinok.com>
> 
> Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
> ---
>  package/mender-artifact/mender-artifact.hash | 2 +-
>  package/mender-artifact/mender-artifact.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

So, I have applied to next, but I had to fix license file hashes: two
were incorrect. Also, a new license file should have been added. Please
make sure to run "make legal-info" after bumping a package, to make
sure the license information is still correct.

See the final commit at:

  https://git.buildroot.org/buildroot/commit/?h=next&id=069e6de63fc252fd7add9763c76bb61de954ec1f

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
