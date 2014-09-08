From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 22:09:40 +0200
Subject: [Buildroot] [PATCH] toolchain/glibc: add version 2.20
In-Reply-To: <1410173601-32721-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410173601-32721-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140908220940.40091636@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  8 Sep 2014 07:53:21 -0300, Gustavo Zacarias wrote:
> And remove version 2.18 to just keep two versions around.
> So bump the default to 2.19.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/2.18/glibc-0001-accept-make4.patch | 33 ------------------------
>  package/glibc/Config.in                          | 11 ++++----
>  2 files changed, 5 insertions(+), 39 deletions(-)
>  delete mode 100644 package/glibc/2.18/glibc-0001-accept-make4.patch

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
