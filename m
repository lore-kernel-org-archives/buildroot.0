From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:45:31 +0100
Subject: [Buildroot] [PATCH v6 2/4] package/environment-setup: add
 configure alias
In-Reply-To: <1588085161-28104-2-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
 <1588085161-28104-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20201103224531.07720c33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 16:45:59 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> In order to simplify the usage of a buildroot toolchain within
> the buildroot shell, a "configure" alias is provided to call
> ./configure with the correct flags.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  docs/manual/using-buildroot-toolchain.txt      | 4 ++--
>  package/environment-setup/environment-setup    | 1 +
>  package/environment-setup/environment-setup.mk | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)

I have applied, with a few tweaks here and there. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
