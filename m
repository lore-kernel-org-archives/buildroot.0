From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:45:40 +0100
Subject: [Buildroot] [PATCH v6 3/4] package/environment-setup: add cmake
 alias
In-Reply-To: <1588085161-28104-3-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
 <1588085161-28104-3-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20201103224540.6cb3a3c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 16:46:00 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> In order to simplify the usage of a buildroot toolchain within
> the buildroot shell, a "cmake" alias is provided to call cmake
> with the correct toolchain file and options.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/environment-setup/environment-setup    | 1 +
>  package/environment-setup/environment-setup.mk | 3 +++
>  2 files changed, 4 insertions(+)

I have applied, with a few tweaks here and there. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
