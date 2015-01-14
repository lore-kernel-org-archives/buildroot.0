From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:28:32 +0100
Subject: [Buildroot] [PATCH] connman: bump to version 1.27
In-Reply-To: <1421174102-26667-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421174102-26667-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114192832.7181ab9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 13 Jan 2015 15:35:02 -0300, Gustavo Zacarias wrote:
> Also drop PAN profile comment since it now supports GN and PANU profiles
> as well to avoid overcrowding.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/connman/Config.in    | 5 ++---
>  package/connman/connman.hash | 2 +-
>  package/connman/connman.mk   | 2 +-
>  3 files changed, 4 insertions(+), 5 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
