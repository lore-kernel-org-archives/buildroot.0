From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:27:20 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.6-P2
In-Reply-To: <1424346745-4643-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424346745-4643-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150219212720.20094031@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 19 Feb 2015 08:52:25 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2015-1349 - Revoking a managed trust anchor and supplying an
> untrusted replacement could cause namedto crash with an assertion
> failure.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
