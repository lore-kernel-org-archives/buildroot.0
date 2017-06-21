From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 07:44:26 +0200
Subject: [Buildroot] [PATCH] c-ares: security bump to version 1.13.0
In-Reply-To: <20170620212421.17455-1-peter@korsgaard.com>
References: <20170620212421.17455-1-peter@korsgaard.com>
Message-ID: <20170621074426.6db80181@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 23:24:21 +0200, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2017-1000381: The c-ares function `ares_parse_naptr_reply()`, which is
> used for parsing NAPTR responses, could be triggered to read memory outside
> of the given input buffer if the passed in DNS response packet was crafted
> in a particular way.
> 
> https://c-ares.haxx.se/adv_20170620.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/c-ares/c-ares.hash | 2 +-
>  package/c-ares/c-ares.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
