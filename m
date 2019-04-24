From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:19:02 +0200
Subject: [Buildroot] [PATCH] package/python-can: bump to version 3.1.1
In-Reply-To: <1556098652-19128-1-git-send-email-angelo@amarulasolutions.com>
References: <1556098652-19128-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190424221902.33e13bd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 11:37:32 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch bumps python-can to version 3.1.1, it removes md5 sum from
> hash file cause it's not present anymore on the pypi website.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-can/python-can.hash | 5 ++---
>  package/python-can/python-can.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
