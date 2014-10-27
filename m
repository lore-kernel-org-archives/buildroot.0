From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:50:35 +0100
Subject: [Buildroot] [PATCH] wget: bump to version 1.16
In-Reply-To: <1414414808-26134-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414414808-26134-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141027175035.26c6cf19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 27 Oct 2014 10:00:08 -0300, Gustavo Zacarias wrote:
> Add hash file.
> And drop autoreconf/gettextize/patch, it's upstream now.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../wget-0001-spawn-fix-link-error-on-uclibc.patch | 40 ----------------------
>  package/wget/wget.hash                             |  2 ++
>  package/wget/wget.mk                               |  6 +---
>  3 files changed, 3 insertions(+), 45 deletions(-)
>  delete mode 100644 package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
>  create mode 100644 package/wget/wget.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
