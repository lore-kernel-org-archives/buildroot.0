From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:43:01 +0100
Subject: [Buildroot] [PATCH next v8 5/6] docs/manual: add details about
 top-level parallel build support
In-Reply-To: <20191105164646.23820-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 5 Nov 2019 17:46:44 +0100")
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-6-thomas.petazzoni@bootlin.com>
Message-ID: <875zj2aglm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  docs/manual/common-usage.txt        | 47 +++++++++++++++++++++++++++++
 >  docs/manual/faq-troubleshooting.txt |  3 ++
 >  docs/manual/quickstart.txt          |  8 ++---
 >  3 files changed, 54 insertions(+), 4 deletions(-)

 > diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
 > index a87980d4a2..2d315de440 100644
 > --- a/docs/manual/common-usage.txt
 > +++ b/docs/manual/common-usage.txt
 > @@ -347,6 +347,53 @@ Refer to the help text of this script for more details:
 >  utils/size-stats-compare -h
 >  ----------------
 
 > +[[top-level-parallel-build]]
 > +=== Top-level parallel build
 > +
 > +.Note
 > +This section deals with a very experimental feature, which is known to
 > +break even in some non-unusual situations. Use at your own risk.
 > +
 > +Buildroot has always been capable of using parallel build on a per
 > +package basis: each package is built by Buildroot using +make -jN+ (or
 > +the equivalent invocation for non-make-based build systems). The level
 > +of parallelism is by default number of CPUs + 1, but it can be
 > +adjusted using the +BR2_JLEVEL+ configuration option.
 > +
 > +Until 2019.02, Buildroot was however building packages in a serial

Committed to next after changing the version reference to Buildroot
2020.02, thanks.

-- 
Bye, Peter Korsgaard
