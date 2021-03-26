From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:35:44 +0100
Subject: [Buildroot] [PATCH] package/squid: Use external libltdl
In-Reply-To: <20210317060145.25009-1-post@lespocky.de> (Alexander Dahl's
 message of "Wed, 17 Mar 2021 07:01:45 +0100")
References: <20210317060145.25009-1-post@lespocky.de>
Message-ID: <87k0ptk0fz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > When enabling BR2_PACKAGE_LIBTOOL it depended on the build order if
 > squid used the external libltdl or built it from its internal copy. That
 > broke the build in fli4l where we have additional post build checks
 > analyzing runtime dependencies and a separate step for copying build
 > artefacts to target packages.

 > Depend on the external libltdl unconditionally like done with commit
 > 3efc5a250c1c ("package/siproxd: new package") for package siproxd
 > recently as well. For reproducibility, size, and security.

 > Link: https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-sunxi/672/
 > Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Alexander Dahl <post@lespocky.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
