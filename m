From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:24:41 +0200
Subject: [Buildroot] [PATCH] package/exim: security bump to version
 4.92.2
In-Reply-To: <20190906113447.13402-1-peter@korsgaard.com>
References: <20190906113447.13402-1-peter@korsgaard.com>
Message-ID: <20190907142441.7a023374@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 13:34:46 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2019-15846: Local or remote attacker can execute programs with
> root privileges
> 
> For details, see the advisory:
> https://exim.org/static/doc/security/CVE-2019-15846.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/exim/exim.hash | 2 +-
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
