From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:33:28 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: new package
In-Reply-To: <1444858103-556-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1444858103-556-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20151021233328.4cf7d39d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Wed, 14 Oct 2015 23:28:23 +0200, Angelo Compagnucci wrote:
> This patch adds python-pillow, the friendly python image library fork.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-pillow/Config.in        | 53 ++++++++++++++++++++++++++++++++++
>  package/python-pillow/python-pillow.mk | 36 +++++++++++++++++++++++
>  3 files changed, 90 insertions(+)
>  create mode 100644 package/python-pillow/Config.in
>  create mode 100644 package/python-pillow/python-pillow.mk

Following Peter Korsgaard's review, I've marked your patch as Changes
Requested since there are a number of issues/comments to be addressed.
Please make sure to send an updated version, otherwise we'll forget
about your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
