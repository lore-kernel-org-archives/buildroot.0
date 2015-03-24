From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:54:47 +0100
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.13
In-Reply-To: <1427196675-5815-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427196675-5815-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150325005447.316fdf8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 24 Mar 2015 08:31:15 -0300, Gustavo Zacarias wrote:
> Patch now upstream so remove.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../sudo/0001-make-signame-include-unistd_h.patch    | 20 --------------------
>  package/sudo/sudo.hash                               |  4 ++--
>  package/sudo/sudo.mk                                 |  2 +-
>  3 files changed, 3 insertions(+), 23 deletions(-)
>  delete mode 100644 package/sudo/0001-make-signame-include-unistd_h.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
