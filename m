From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 18:09:57 +0100
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130108180957.30c9f629@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sun, 23 Dec 2012 02:20:29 +0200, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  package/Config.in                  |    1 +
>  package/proxychains/Config.in      |    7 +++++++
>  package/proxychains/proxychains.mk |   10 ++++++++++
>  3 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 package/proxychains/Config.in
>  create mode 100644 package/proxychains/proxychains.mk

This new package generates the following build failure:

  http://autobuild.buildroot.org/results/7364b557c1fea642a3631c4735dd93f02ba70dd5/build-end.log

Can you try to investigate and see if you can provide a patch to fix it?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
