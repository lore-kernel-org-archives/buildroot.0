From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:18:14 +0100
Subject: [Buildroot] [PATCH] package/rauc: security bump to version 1.5
In-Reply-To: <20201221112415.29503-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 21 Dec 2020 12:24:14 +0100")
References: <20201221112415.29503-1-peter@korsgaard.com>
Message-ID: <8735zxlyah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-25860: Time-of-Check-Time-of-Use Vulnerability in code that
 >   checks and installs a firmware bundle.
 >   For more details, see the advisory:
 >   https://github.com/rauc/rauc/security/advisories/GHSA-cgf3-h62j-w9vv

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
