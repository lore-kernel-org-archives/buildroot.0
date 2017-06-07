From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 21:54:34 +0200
Subject: [Buildroot] [PATCH] package/xf86-input-tslib: enable static
	build
In-Reply-To: <20170607140738.6147-1-martin.kepplinger@ginzinger.com> (Martin
 Kepplinger's message of "Wed, 7 Jun 2017 16:07:38 +0200")
References: <20170607070100.10344-1-martin.kepplinger@ginzinger.com>
 <20170607140738.6147-1-martin.kepplinger@ginzinger.com>
Message-ID: <87zidjbmkl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > since tslib now supports static builds the dependency on !BR2_STATIC_LIBS
 > can be removed from xf86-input-tslib too.

 > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
 > ---

 > I'll look at the rest of the possible candidates later

Committed, thanks.

-- 
Bye, Peter Korsgaard
