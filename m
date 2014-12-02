From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 10:29:56 +0100
Subject: [Buildroot] [PATCH v2] package/bdwgc: only enable on supported
	architectures
In-Reply-To: <1417475601-3688-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 2 Dec 2014 00:13:21 +0100")
References: <1417475601-3688-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877fya2ycr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > bdwgc has support for a sub-set of the architectures we support.
 > Since there is roughly a 50-50 split of our architectures that have
 > support in bdwgc vs. those that do not, use a positive dependency logic,
 > rather than a negative one.

 > The list was constructed by visual inspection of the source code of
 > bdwgc, but the header doing the check is, to say it politely, a bit
 > difficult to read...

 > So, some working archotectures may be missing. Users needing it may
 > investigate if their architectures are indeed supported.

 > Fixes;
 >     http://autobuild.buildroot.net/results/529/529b0b6dd47744c13f56e59a4c669a3f5d56530d/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Pedro Aguilar <paguilar@paguilar.org>
 > Cc: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
