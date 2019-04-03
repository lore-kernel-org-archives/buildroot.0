From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:34:51 +0200
Subject: [Buildroot] [PATCH] package/wget: security bump to version
 1.20.2
In-Reply-To: <20190403155628.23335-1-peter@korsgaard.com>
References: <20190403155628.23335-1-peter@korsgaard.com>
Message-ID: <20190403213451.3fa2a711@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Apr 2019 17:56:28 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> From NEWS:
> 
> * Changes in Wget 1.20.2
> ** Fixed a buffer overflow vulnerability
> 
> For more details, see the announcement:
> https://lists.gnu.org/archive/html/info-gnu/2019-04/msg00000.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wget/wget.hash | 4 ++--
>  package/wget/wget.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
