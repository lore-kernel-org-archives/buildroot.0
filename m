From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:45:20 +0100
Subject: [Buildroot] [PATCH v6 1/4] package/environment-setup: new
 package
In-Reply-To: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20201103224520.6b72d513@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 16:45:58 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Install an helper script to setup a build environment based on buildroot.
> It's useful when a developer wants to use a buildroot generated sdk to
> build an external project.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog:
> v1->v2:
>  * Moved from echo to printf (Yann)
>  * removed sh extension (Yann)
>  * Adding missing script
> v2->v3:
>  * Split the patch
> v3->v4:
>  * Better handling of SDK_PATH dir (Mircea Gliga)
> v4->v5:
>  * Cleaning the script using SDK_PATH where possible (Mircea Gliga)
> v5->v6:
>  * Removed unused sed expressione (Mircea Gliga)
>  * Moved to be an host package
>  * fix PATH leaking: before path from the current user
>    can leak into the script
>  * Removed PS1

This one was superseded by Matt's patch, which I have applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
