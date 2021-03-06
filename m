From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 17:06:35 +0100
Subject: [Buildroot] [PATCH 1/3] docs/manual: do not expose CPE_ID_VALID
 as package-settable
In-Reply-To: <4ebb44a253dcc8fd32938ce49c4b776dcf4d2ffd.1614983175.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 5 Mar 2021 23:27:42 +0100")
References: <cover.1614983175.git.yann.morin.1998@free.fr>
 <4ebb44a253dcc8fd32938ce49c4b776dcf4d2ffd.1614983175.git.yann.morin.1998@free.fr>
Message-ID: <878s708dx0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FOO_CPE_ID_VALID is an internal implementation detail. Packages should
 > really define an actual CPE_ID variable to trigger their full CPE_ID
 > definition.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  docs/manual/adding-packages-generic.txt | 6 ------
 >  1 file changed, 6 deletions(-)

 > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
 > index 75af18b70c..67336b4c1f 100644
 > --- a/docs/manual/adding-packages-generic.txt
 > +++ b/docs/manual/adding-packages-generic.txt
 > @@ -531,12 +531,6 @@ infrastructure assumes the package provides valid CPE information. In
 >  this case, +LIBFOO_CPE_ID_VALID = YES+ will be set, and the generic
 >  package infrastructure will define +LIBFOO_CPE_ID+.

I would even drop the mention of the variable just here above.
Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
