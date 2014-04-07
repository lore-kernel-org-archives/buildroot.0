From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Apr 2014 15:29:19 +0200
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
In-Reply-To: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140407152919.2d1147fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  7 Apr 2014 10:04:39 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../2.18-svnr23787/glibc-0001-accept-make4.patch   | 33 ----------------------
>  package/glibc/glibc.mk                             |  2 +-
>  2 files changed, 1 insertion(+), 34 deletions(-)
>  delete mode 100644 package/glibc/2.18-svnr23787/glibc-0001-accept-make4.patch

So we don't do like glibc where we support both 2.18 and 2.19 ? This is
really a question, maybe it makes sense to only support one version at
a time. In which case we could remove 2.18 from glibc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
