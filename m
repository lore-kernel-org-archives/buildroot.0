From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 09:22:07 +0200
Subject: [Buildroot] [PATCH] Revert "lvm2: disable build with uClibc-ng"
In-Reply-To: <20170426072646.GA31873@waldemar-brodkorb.de>
References: <20170426072646.GA31873@waldemar-brodkorb.de>
Message-ID: <20170501092207.4fb49578@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 09:26:47 +0200, Waldemar Brodkorb wrote:
> This reverts commit 66f136a9f64b880eefa769c1261916773d8f28c0.
> 
> Issue fixed with uClibc-ng update to 1.0.24.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/cryptsetup/Config.in    | 5 ++---
>  package/dmraid/Config.in        | 5 ++---
>  package/docker-engine/Config.in | 1 -
>  package/lvm2/Config.in          | 6 ++----
>  package/udisks/Config.in        | 6 ++----
>  5 files changed, 8 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
