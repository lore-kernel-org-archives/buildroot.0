From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:38:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/jq: bump to git version
 a97638713ad3 (still 1.6-based)
In-Reply-To: <20191220202728.14001-1-patrickdepinguin@gmail.com>
References: <20191220202728.14001-1-patrickdepinguin@gmail.com>
Message-ID: <20191221223843.4ee3e11d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Dec 2019 21:27:28 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> jq 1.6 has a severe performance regression compared to 1.5. The problem is
> reported [1] and fixed [2] upstream, but there are different commits and
> later subsequent fixes on top of them that make it cumbersome to patch
> specifically.
> 
> Instead, bump to a recent git version.
> 
> [1] https://github.com/stedolan/jq/issues/1826
> [2] https://github.com/stedolan/jq/pull/1834
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/jq/jq.hash | 2 +-
>  package/jq/jq.mk   | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
