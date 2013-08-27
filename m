From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Aug 2013 00:33:20 +0200
Subject: [Buildroot] [PATCHv2 0/3] Add subversion package
In-Reply-To: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 27 Aug 2013 19:08:02 +0200")
References: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738puix1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is the second version of the subversion package addition. The
 Thomas> changes since v1 are:

 Thomas>  * The patch factorizing the 'depends on BR2_PACKAGE_NEON' now appears
 Thomas>    first in the series. This was changed after the comment of Arnout,
 Thomas>    who didn't realise that the factorization was happening in the
 Thomas>    second patch of the series. Indeed, it makes more sense to have
 Thomas>    this change first.

 Thomas>  * I've introduced an hidden BR2_PACKAGE_NEON_XML option, that other
 Thomas>    packages can select to request XML support in Neon, without caring
 Thomas>    for the particular XML backend being used. This was suggested by
 Thomas>    Arnout.

Committed series to next, thanks.

-- 
Bye, Peter Korsgaard
