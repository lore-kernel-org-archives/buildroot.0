From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 14:35:32 +0200
Subject: [Buildroot] [PATCH] graphs/depends: do not draw transitive
	dependencis by default
In-Reply-To: <1402352936-21264-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 10 Jun 2014 00:28:56 +0200")
References: <1402352936-21264-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oaxxdm23.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The transitive dependencies make the graphs barely readable for large
 > configs, with a large number of packages.

 > So, just switch to not drawing the transitive dependencies by default.

 > By popular demand... ;-)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc; Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  docs/manual/common-usage.txt  | 2 +-
 >  support/scripts/graph-depends | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
 > index eb83990..71fe5a3 100644
 > --- a/docs/manual/common-usage.txt
 > +++ b/docs/manual/common-usage.txt
 > @@ -207,7 +207,7 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 >    default, +0+, means no limit.
 
 >  * +--transitive+, +--no-transitive+, to draw (or not) the transitive
 > -  dependencies. The default is to draw transitive dependencies.
 > +  dependencies. The default is not to draw transitive dependencies.

I'm not a native speaker, but I think it should be '.. is to not draw'.

Committed with that (and the commit title) fixed, thanks.

-- 
Bye, Peter Korsgaard
