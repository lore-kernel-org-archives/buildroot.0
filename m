From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 08:37:59 +0200
Subject: [Buildroot] [PATCH] package/dhcp: security bump to version
 4.4.2-P1
In-Reply-To: <20210530084457.24417-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 30 May 2021 10:44:57 +0200")
References: <20210530084457.24417-1-peter@korsgaard.com>
Message-ID: <878s3imdh4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-25217: A buffer overrun in lease file parsing code can be used to
 >   exploit a common vulnerability shared by dhcpd and dhclient

 > For details, see the advisory:
 > https://kb.isc.org/docs/cve-2021-25217

 > Update the LICENSE hash for a change of copyright years.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
