From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:13:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: bump to version
 9609cb56a8f62868ccf264493bc9c3b4d5762fcf
In-Reply-To: <20200701044212.11378-1-james.hilliard1@gmail.com>
References: <20200701044212.11378-1-james.hilliard1@gmail.com>
Message-ID: <20200712231316.5aa689f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Jun 2020 22:42:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to update the location to point to the current maintained
> upstream repo as well since the existing one is unmaintained.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/zlib-ng/zlib-ng.hash | 2 +-
>  package/zlib-ng/zlib-ng.mk   | 4 ++--
>  package/zlib/Config.in       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
