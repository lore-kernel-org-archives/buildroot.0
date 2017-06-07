From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 21:54:24 +0200
Subject: [Buildroot] [PATCH v2] package/tslib: enable statically linked
	building
In-Reply-To: <20170607070100.10344-1-martin.kepplinger@ginzinger.com> (Martin
 Kepplinger's message of "Wed, 7 Jun 2017 09:01:00 +0200")
References: <20170606213343.198d1375@free-electrons.com>
 <20170607070100.10344-1-martin.kepplinger@ginzinger.com>
Message-ID: <874lvrd15b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > From: Martin Kepplinger <martink@posteo.de>
 > tslib can be configured to be built statically linked. So let's add this option.

 > tslib is quite configurable and each module can be selected to be built into
 > the static build. This configuration includes the hardware independent filter
 > modules (obviously), and the Linux evdev input module.

 > This results in a configuration that fully supports multitouch in any
 > combination.

 > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
