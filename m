From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Aug 2020 22:10:13 +0200
Subject: [Buildroot] [PATCH for LTS] package/dropbear: backport security
 fix for CVE-2018-20685
In-Reply-To: <20200804140009.24861-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 4 Aug 2020 16:00:08 +0200")
References: <20200804140009.24861-1-patrickdepinguin@gmail.com>
Message-ID: <87v9hvy1qy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The update to 2020.79 contains several other changes that may not be
 > appropriate for the LTS branch, hence just backport the single fix.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
