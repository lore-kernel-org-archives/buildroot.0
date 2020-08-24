From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:39:03 +0200
Subject: [Buildroot] [PATCH] package/hostapd: add upstream 2020-1
 security patches
In-Reply-To: <20200824104615.4128-1-peter@korsgaard.com>
References: <20200824104615.4128-1-peter@korsgaard.com>
Message-ID: <20200824223903.7f93c8de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 12:46:15 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerabilities:
> 
> CVE-2020-12695: The Open Connectivity Foundation UPnP specification before
> 2020-04-17 does not forbid the acceptance of a subscription request with a
> delivery URL on a different network segment than the fully qualified
> event-subscription URL, aka the CallStranger issue.
> 
> For details, see the advisory:
> https://w1.fi/security/2020-1/upnp-subscribe-misbehavior-wps-ap.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/hostapd/hostapd.hash | 3 +++
>  package/hostapd/hostapd.mk   | 7 +++++++
>  2 files changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
