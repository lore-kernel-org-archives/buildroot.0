From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:38:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version
 0.6.3
In-Reply-To: <20190424185345.52875-1-aduskett@gmail.com>
References: <20190424185345.52875-1-aduskett@gmail.com>
Message-ID: <20190424213814.3741b8a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 14:53:45 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In additon:
>   - Rebase both patches to work with the new version.
>   - Add the dependency libconfig
> 
> All tests pass:
>   - br-arm-full [1/6]: OK
>   - br-arm-cortex-a9-glibc [2/6]: OK
>   - br-arm-cortex-m4-full [3/6]: SKIPPED
>   - br-x86-64-musl [4/6]: OK
>   - br-arm-full-static [5/6]: SKIPPED
>   - sourcery-arm [6/6]: OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/janus-gateway/0001-disable-ssp.patch  | 37 ++++++++++-----
>  ...dd-test-for-Wunused-but-set-variable.patch | 47 ++++++++++++-------
>  package/janus-gateway/Config.in               |  1 +
>  package/janus-gateway/janus-gateway.hash      |  2 +-
>  package/janus-gateway/janus-gateway.mk        |  4 +-
>  5 files changed, 57 insertions(+), 34 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
