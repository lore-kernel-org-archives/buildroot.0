From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 17:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] emlog: new package
In-Reply-To: <1450446298-3523-1-git-send-email-joris.lijssens@gmail.com>
References: <1450446298-3523-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151218170709.43ddaabd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

On Fri, 18 Dec 2015 14:44:58 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/emlog/Config.in  | 12 ++++++++++++
>  package/emlog/emlog.hash |  2 ++
>  package/emlog/emlog.mk   | 21 +++++++++++++++++++++
>  4 files changed, 36 insertions(+)
>  create mode 100644 package/emlog/Config.in
>  create mode 100644 package/emlog/emlog.hash
>  create mode 100644 package/emlog/emlog.mk

I guess this is a new version of the emlog patch, right?

If so, a new iteration should be labeled as "PATCH v2" and should carry
a changelog. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches.

This helps us a lot to understand what has changed between the
different iterations of a patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
