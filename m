From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Sep 2012 07:10:40 +0200
Subject: [Buildroot] [PATCH] vala: fix documentation build problem
In-Reply-To: <5058E0C3.8070502@mind.be>
References: <1347914008-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5058E0C3.8070502@mind.be>
Message-ID: <20120919071040.2768d32d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 18 Sep 2012 22:59:47 +0200, Arnout Vandecappelle wrote:

> > +ifeq ($(BR2_HAVE_DOCUMENTATION),y)
> > +VALA_DEPENDENCIES += host-libxslt
> 
>   Don't you need ac_cv_path_XSLTPROC=: in the else case too?

Yes that's what PATCHv2 did.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
