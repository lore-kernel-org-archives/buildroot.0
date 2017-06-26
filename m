From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:49:50 +0200
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.3
In-Reply-To: <20170618213502.16233-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 18 Jun 2017 23:35:02 +0200")
References: <20170618213502.16233-1-peter@korsgaard.com>
Message-ID: <87vanji3xd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-9468 - Joseph Bisch discovered that Irssi does not properly handle
 > DCC messages without source nick/host.  A malicious IRC server can take
 > advantage of this flaw to cause Irssi to crash, resulting in a  denial of
 > service.

 > CVE-2017-9469 - Joseph Bisch discovered that Irssi does not properly handle
 > receiving incorrectly quoted DCC files.  A remote attacker can take
 > advantage of this flaw to cause Irssi to crash, resulting in a denial of
 > service.

 > See https://irssi.org/security/irssi_sa_2017_06.txt for more details.

 > Remove 0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch as it
 > applied upstream and drop autoreconf as configure.ac is no longer patched.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
