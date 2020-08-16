From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 22:37:19 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/uredir: new package
In-Reply-To: <20200720204825.15826-3-ps.report@gmx.net>
References: <20200720204825.15826-1-ps.report@gmx.net>
 <20200720204825.15826-3-ps.report@gmx.net>
Message-ID: <20200816223719.45c2f12a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 22:48:25 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - change download url to fix match with provided md5 sum
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/uredir/Config.in   |  9 +++++++++
>  package/uredir/uredir.hash |  4 ++++
>  package/uredir/uredir.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/uredir/Config.in
>  create mode 100644 package/uredir/uredir.hash
>  create mode 100644 package/uredir/uredir.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
