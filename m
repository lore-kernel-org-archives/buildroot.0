From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:15:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongrel2: enable parallel build
In-Reply-To: <20200907210346.297682-1-fontaine.fabrice@gmail.com>
References: <20200907210346.297682-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907231527.17bfd770@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 23:03:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Parallel build is fixed since version 1.9.2 and
> https://github.com/mongrel2/mongrel2/commit/375d2de08934807f7171c413f785a9a23db712d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongrel2/mongrel2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
