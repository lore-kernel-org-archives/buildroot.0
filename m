From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2015 23:14:38 +0200
Subject: [Buildroot] [PATCH] package/stress-ng: new package
In-Reply-To: <1441792427-15297-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Wed, 9 Sep 2015 11:53:47 +0200")
References: <1441792427-15297-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87h9n3gurl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 >  package/Config.in                |  1 +
 >  package/stress-ng/Config.in      | 25 +++++++++++++++++++++++++
 >  package/stress-ng/stress-ng.hash |  2 ++
 >  package/stress-ng/stress-ng.mk   | 22 ++++++++++++++++++++++
 >  4 files changed, 50 insertions(+)
 >  create mode 100644 package/stress-ng/Config.in
 >  create mode 100644 package/stress-ng/stress-ng.hash
 >  create mode 100644 package/stress-ng/stress-ng.mk

 > +++ b/package/stress-ng/stress-ng.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# stress-ng
 > +#
 > +################################################################################
 > +
 > +STRESS_NG_VERSION = 0.04.16
 > +STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng/
 > +STRESS_NG_LICENSE = GPLv2
 > +STRESS_NG_LICENSE_FILES = COPYING

All the source files seem to have the 'or (at your option) any later
version' text, so I've made this GPLv2+ and committed, thanks.

-- 
Bye, Peter Korsgaard
