From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:27:56 +0200
Subject: [Buildroot] [PATCH] package/gauche: bump to version 0.9.9
In-Reply-To: <20200429030745.16892-1-ryanbarnett3@gmail.com>
References: <20200429030745.16892-1-ryanbarnett3@gmail.com>
Message-ID: <20200429222756.5ce644af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 22:07:45 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> * Update hash file to two space format
> * COPYING hash updated due to copyright year
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/gauche/0001-fix-so-suffix.patch | 32 -------------------------
>  package/gauche/gauche.hash              |  8 +++----
>  package/gauche/gauche.mk                |  2 +-
>  3 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 package/gauche/0001-fix-so-suffix.patch

You had not explained what had happened with the patch, so I expanded
the commit log when applying.

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
