From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:17:09 +0100
Subject: [Buildroot] [PATCH] trinity: bump to version 1.6
In-Reply-To: <1447213574-10726-1-git-send-email-andrew.donnellan@au1.ibm.com>
References: <1447213574-10726-1-git-send-email-andrew.donnellan@au1.ibm.com>
Message-ID: <20151111151709.4f062476@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Donnellan,

On Wed, 11 Nov 2015 14:46:14 +1100, Andrew Donnellan wrote:
> Bump trinity version to 1.6. Remove backported vt.c missing include patch
> as it is now included in the upstream release.
> 
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> ---
>  ...ssing-include-to-fix-building-with-uClibc.patch | 47 ----------------------
>  package/trinity/trinity.mk                         |  2 +-
>  2 files changed, 1 insertion(+), 48 deletions(-)
>  delete mode 100644 package/trinity/0001-vt.c-add-missing-include-to-fix-building-with-uClibc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
