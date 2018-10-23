From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:08:35 +0200
Subject: [Buildroot] [PATCH] scanpypi: improve BSD licence handling
In-Reply-To: <20181011055411.22801-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 11 Oct 2018 07:54:11
 +0200")
References: <20181011055411.22801-1-yegorslists@googlemail.com>
Message-ID: <87ftwwdzws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > When used without spdx_lookup the BSD licence cannot be
 > detected correctly because many Python packages just specify
 > BSD without the exact version in their metadata. So add a
 > special message warning the user instead of the licence id.

 > Bonus: fix typo.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
