From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:28:10 +0100
Subject: [Buildroot] [PATCH] memcached: security bump to version 1.4.33
In-Reply-To: <1478041170-5083-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478041170-5083-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161102172810.0bd8d4cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 19:59:30 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-8704 - server append/prepend remote code execution
> vulnerability.
> CVE-2016-8705 - server update remote code execution vulnerability.
> CVE-2016-8706 - server SASL authentication remote code execution
> vulnerability.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
