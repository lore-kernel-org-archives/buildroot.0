From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:49:56 +0200
Subject: [Buildroot] [PATCH] fscryptctl: bump version for AES-128-CBC /
	AES-128-CTS support
In-Reply-To: <20170913062151.17055-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Sep 2017 08:21:51 +0200")
References: <20170913062151.17055-1-peter@korsgaard.com>
Message-ID: <87efrb2aij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Which are supported from linux-4.13 onwards.
 > While we're at it, add a DEVELOPERS entry.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  DEVELOPERS                         | 1 +
 >  package/fscryptctl/fscryptctl.hash | 2 +-
 >  package/fscryptctl/fscryptctl.mk   | 2 +-
 >  3 files changed, 3 insertions(+), 2 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
