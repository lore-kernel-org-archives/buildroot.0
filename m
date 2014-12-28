From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:10:33 +0100
Subject: [Buildroot] [PATCH 1/2] links: bump to version 2.8
In-Reply-To: <1419769878-25114-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419769878-25114-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141228221033.320df997@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 28 Dec 2014 09:31:17 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/links/0001-no-largefile.patch        | 26 ++++++++++++++++++++++++++
>  package/links/links-0001-no-largefile.patch  | 22 ----------------------
>  package/links/links-0002-CVE-2013-6050.patch | 17 -----------------
>  package/links/links.hash                     |  2 ++
>  package/links/links.mk                       |  2 +-
>  5 files changed, 29 insertions(+), 40 deletions(-)
>  create mode 100644 package/links/0001-no-largefile.patch
>  delete mode 100644 package/links/links-0001-no-largefile.patch
>  delete mode 100644 package/links/links-0002-CVE-2013-6050.patch
>  create mode 100644 package/links/links.hash

Thanks, applied after doing a test build (and therefore checking the
hash). Could you try to submit the largefile patch upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
