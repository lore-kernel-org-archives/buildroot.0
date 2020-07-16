From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:06:49 +0200
Subject: [Buildroot] [PATCH] package/go: bump version to 1.13.13
In-Reply-To: <20200716185615.1439944-1-christian@paral.in>
References: <20200716185615.1439944-1-christian@paral.in>
Message-ID: <20200716230649.62cd4e49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 11:56:15 -0700
Christian Stewart <christian@paral.in> wrote:

> go1.13.13 (released 2020/07/14) includes security fixes to the
> crypto/x509 and net/http packages.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
