From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 21:26:06 +0200
Subject: [Buildroot] [PATCH 04/21] package/tvheadend: bump version
In-Reply-To: <e2187ddfaefbda7a99b3e9f2b149c0cbbb9c12ac.1401658972.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:43:35 +0200")
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <e2187ddfaefbda7a99b3e9f2b149c0cbbb9c12ac.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <878upfw1td.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Lotta fixes all over the tree.
 > Still no new release... :-/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/tvheadend/tvheadend.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
 > index ac4c290..244e129 100644
 > --- a/package/tvheadend/tvheadend.mk
 > +++ b/package/tvheadend/tvheadend.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
 > +TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5

Is there something missing from this commit? The patch no longer
applies:

http://autobuild.buildroot.net/results/808/808e5bb035ddef09339fe6a4d00147ee29ec2a18/build-end.log

-- 
Bye, Peter Korsgaard
