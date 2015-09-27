From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 21:22:05 +0200
Subject: [Buildroot] [PATCH v2] drbd-utils: bump version to 8.9.4
In-Reply-To: <1443101800-12027-1-git-send-email-cvubrugier@fastmail.fm>
References: <1443101800-12027-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150927212205.6314710b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 24 Sep 2015 15:36:40 +0200, Christophe Vu-Brugier wrote:
> Version 8.9.4 of drbd-utils contains fixes for the musl C library.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4e0/4e0ed65b2e06f4ccadcad5b4302e6334667ecbdb
> 
> Moreover, this commit adds the --without-manual option to ./configure
> and drops the hook used to disable the documentation.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> 
> ---
> Changes v1 -> v2:
>  * fix commit message for Autobuild (comment from Vicente)
>  * fix checksum (comment from Vicente)
>  * pass --without-manual to configure
> ---
>  package/drbd-utils/drbd-utils.hash |  2 +-
>  package/drbd-utils/drbd-utils.mk   | 10 ++--------
>  2 files changed, 3 insertions(+), 9 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
