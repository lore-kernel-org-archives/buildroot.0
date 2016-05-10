From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:55:13 +0200
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.19
In-Reply-To: <1462829054-16957-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462829054-16957-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160510155513.6bf4e8c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 May 2016 18:24:14 -0300, Gustavo Zacarias wrote:
> Fixes regression introduced in 3.5.18 (via CVE-2016-4554 patch/fix).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/squid/squid.hash | 6 +++---
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
