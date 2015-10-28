From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 00:05:01 +0100
Subject: [Buildroot] [PATCH v2] Makefile: Remove 'quiet' variable
In-Reply-To: <1444334617-23796-1-git-send-email-cedric.marie@openmailbox.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Marie"'s message of "Thu, 8 Oct 2015 22:03:37
 +0200")
References: <1444334617-23796-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <87fv0u61cy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "C?dric" == C?dric Marie <cedric.marie@openmailbox.org> writes:

 > 'quiet' variable is set and exported, but it is not used. We can safely
 > remove it.

 > This variable is inherited from the Makefile of the Linux kernel, and
 > is not used in Buildroot.

 > In support/scripts/mkmakefile, 'quiet' value is checked, but the test
 > is always true ('quiet' is never set to silent_), so the test can be
 > removed as well.

 > Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

 > ---
 > Changes v1 -> v2:
 >   - KBUILD_VERBOSE must not be removed, it is used for packages based
 >     on Kbuild.

 > Title of PATCH v1 was:
 > Makefile: Remove KBUILD_VERBOSE and quiet

 > In order to describe how the verbosity level is managed in different
 > infrastructures, comments will be added in Makefile (suggested by Arnout).
 > It will be provided in a separate patch.

 > Arnout also suggested not to export 'Q', which seems to be Buildroot
 > internal. This will also be provided in a separate patch, if confirmed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
