From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:20:18 +0200
Subject: [Buildroot] [PATCH] package/hostapd: add upstream 2020-1
 security patches
In-Reply-To: <20200824104615.4128-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 24 Aug 2020 12:46:15 +0200")
References: <20200824104615.4128-1-peter@korsgaard.com>
Message-ID: <87a6yepu0d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2020-12695: The Open Connectivity Foundation UPnP specification before
 > 2020-04-17 does not forbid the acceptance of a subscription request with a
 > delivery URL on a different network segment than the fully qualified
 > event-subscription URL, aka the CallStranger issue.

 > For details, see the advisory:
 > https://w1.fi/security/2020-1/upnp-subscribe-misbehavior-wps-ap.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
