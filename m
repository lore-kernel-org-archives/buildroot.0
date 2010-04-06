From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Apr 2010 21:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] libaio: convert to the GENTARGETS
	infrastructure
In-Reply-To: <1911edfc3f1f1e27098dca2e682f76bf7bc6f128.1270581037.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 6 Apr 2010 21:10:47 +0200")
References: <cover.1270581037.git.thomas.petazzoni@free-electrons.com>
	<cover.1270581037.git.thomas.petazzoni@free-electrons.com>
	<1911edfc3f1f1e27098dca2e682f76bf7bc6f128.1270581037.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87tyroqrw0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libaio/libaio-0.3.109-arches.patch  |  660 +++++++++++++++++++++++++++
 Thomas>  package/libaio/libaio-0.3.109-destdir.patch |   17 +

Thanks, but I really think we should document the patches better. The
ptxdist guys suggested some time ago to do it like the kernel -
E.G. description header with Signed-off-by from the author.
I've already done that for most of the newer patches. You mentioned
something about these patches coming from OE - That would be useful info
to mention (preferably with a link so people can go look if there's an
updated version when we need to bump the version). The same about the
upstream status - Has it been submitted? If so, link to mailing list
archive / bugzilla.

Could you fix that and resend? Thanks!

-- 
Bye, Peter Korsgaard
