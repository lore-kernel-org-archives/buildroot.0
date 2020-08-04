From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Aug 2020 23:38:25 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/cups: bump to version 2.3.3
In-Reply-To: <20200624204347.797088-5-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-5-angelo@amarulasolutions.com>
Message-ID: <20200804233825.3ddf6de4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Jun 2020 22:43:44 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch bumps cups to version 2.3.3.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  ...01-Remove-man-from-BUILDDIRS-in-configure.patch |  8 +++++---
>  package/cups/0002-Do-not-use-genstrings.patch      | 14 ++++++++------
>  .../0004-Remove-PIE-flags-from-the-build.patch     |  8 +++++---
>  package/cups/cups.hash                             |  2 +-
>  package/cups/cups.mk                               |  2 +-
>  5 files changed, 20 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
