From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:49:30 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.8-P2
In-Reply-To: <1450388635-429-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450388635-429-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151217224930.5596c863@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Dec 2015 18:43:55 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> Named is potentially vulnerable to the OpenSSL vulnerabilty described in
> CVE-2015-3193.
> 
> CVE-2015-8461 - Incorrect reference counting could result in an INSIST
> failure if a socket error occurred while performing a lookup.
> 
> CVE-2015-8000 - Insufficient testing when parsing a message allowed
> records with an incorrect class to be be accepted, triggering a REQUIRE
> failure when those records were subsequently cached.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
