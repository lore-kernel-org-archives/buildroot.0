From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:28:27 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/sconeserver: drop unrecognized options
In-Reply-To: <20210303181228.1079557-1-fontaine.fabrice@gmail.com>
References: <20210303181228.1079557-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314232827.57f2e852@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Mar 2021 19:12:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop Magick++-config, lettuce and ui options which are
> not recognized since latest bump in commit
> ca17e0c7a02298b0250cdc121bcacef0b58fffe1 (back in 2018).
> 
> Indeed:
> - Magick++-config is not used since
>   https://github.com/sconemad/sconeserver/commit/b025999b8a9a9715b72d0fc8ccbf0888e163388f
> - Experimental UI and lettuce modules have been dropped since
>   https://github.com/sconemad/sconeserver/commit/ccc1efdb8981fbef63a714ff6315c8a18372090a
> 
> Moreover, replace sconesite-image by image (broken since 2013 and
> https://github.com/sconemad/sconeserver/commit/7693301fdb0076bf7676eb2db278c2f015ac7157)
> 
> As UI and lettuce options are broken since a long time, it does not seem
> useful to add entries in Config.in.legacy
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sconeserver/Config.in      | 17 -----------------
>  package/sconeserver/sconeserver.mk | 19 ++-----------------
>  2 files changed, 2 insertions(+), 34 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
