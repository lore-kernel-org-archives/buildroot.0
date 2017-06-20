From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:24:05 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11-P1
In-Reply-To: <20170620205534.3570-1-peter@korsgaard.com>
References: <20170620205534.3570-1-peter@korsgaard.com>
Message-ID: <20170620232405.3021c096@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 22:55:34 +0200, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2017-3140 is a denial-of-service vulnerability affecting 9.9.10,
> 9.10.5, 9.11.0->9.11.1, 9.9.10-S1, and 9.10.5-S1 when configured with
> Response Policy Zones (RPZ) utilizing NSIP or NSDNAME rules.
> 
> https://kb.isc.org/article/AA-01495/74/CVE-2017-3140
> 
> CVE-2017-3141 is a Windows privilege escalation vector affecting
> 9.2.6-P2+, 9.3.2-P1+, 9.4.x, 9.5.x, 9.6.x, 9.7.x, 9.8.x, 9.9.0->9.9.10,
> 9.10.0->9.10.5, 9.11.0->9.11.1, 9.9.3-S1->9.9.10-S1, and 9.10.5-S1.  The
> BIND Windows installer failed to properly quote the service paths,
> possibly allowing a local user to achieve privilege escalation, if
> allowed by file system permissions.
> 
> https://kb.isc.org/article/AA-01496/74/CVE-2017-3141
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
