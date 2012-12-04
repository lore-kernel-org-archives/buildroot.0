From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 10:12:28 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
Message-ID: <20121204101228.2e78f9a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Mon,  3 Dec 2012 20:47:45 +0100, Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@t-online.de>
> 
> Updating current crosstool-ng config files to 1.17.0
>  crosstool-ng.config-eglibc
>  crosstool-ng.config-glibc
>  crosstool-ng.config-uClibc
> 
> Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
> ---
>  package/crosstool-ng/crosstool-ng.mk               |    2 +-
>  .../crosstool-ng.config-eglibc                     |   73 ++++++++++++++-----
>  .../crosstool-ng.config-glibc                      |   74 +++++++++++++++-----
>  .../crosstool-ng.config-uClibc                     |   71 ++++++++++++++-----
>  4 files changed, 165 insertions(+), 55 deletions(-)

Thanks for doing this work. I think ct-ng now supports minimal
defconfig files. Would it make sense to use that instead of
full .config files in order to reduce the amount of churn when updating
between ct-ng versions? Yann?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
