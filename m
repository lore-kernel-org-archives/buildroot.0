From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 14 May 2011 11:38:33 +0200
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <20110422152527.7ec95de5@surf> (Thomas Petazzoni's message of
	"Fri, 22 Apr 2011 15:25:27 +0200")
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
	<201104120248.26575.vapier@gentoo.org>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E4DC@EXV1.corp.adtran.com>
	<201104121836.55644.vapier@gentoo.org> <20110422152527.7ec95de5@surf>
Message-ID: <878vu9k4fa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Does the "prefers" use case really makes sense ? I have always found
 Thomas> our BR2_PREFER_STATIC_LIB a bit odd, and I think it should be
 Thomas> BR2_USE_STATIC_LIB instead, and compile everything statically.

 Thomas> What do you think ?

I agree (where it makes sense atleast, not all upstream projects might
allow static linking).

-- 
Bye, Peter Korsgaard
