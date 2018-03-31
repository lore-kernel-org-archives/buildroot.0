From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 16:13:46 +0200
Subject: [Buildroot] [PATCH next v8 1/2] libkrb5: New package
In-Reply-To: <1520453758-27666-1-git-send-email-nerv@dawncrow.de>
References: <1520453758-27666-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180331161346.73ec1275@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Mar 2018 21:15:57 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/libkrb5/Config.in    | 13 ++++++++++
>  package/libkrb5/libkrb5.hash |  2 ++
>  package/libkrb5/libkrb5.mk   | 56 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 73 insertions(+)
>  create mode 100644 package/libkrb5/Config.in
>  create mode 100644 package/libkrb5/libkrb5.hash
>  create mode 100644 package/libkrb5/libkrb5.mk

Applied to master after making the following changes:

    [Thomas:
     - remove LIBKRB5_VERSION_MAJOR
     - minor tweaks to commit title and Config.in help text]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
