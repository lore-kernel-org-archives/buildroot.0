From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Aug 2017 09:01:13 +0200
Subject: [Buildroot] [PATCH next 1/2] lirc-tools: remove useless
 libusb-compat dependnecy
In-Reply-To: <20170831041855.3cdhvuibow4ulhgb@tarshish>
References: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
 <20170830222946.5ad6f28b@windsurf.lan>
 <20170831041855.3cdhvuibow4ulhgb@tarshish>
Message-ID: <20170831090113.1806f75a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Aug 2017 07:18:55 +0300, Baruch Siach wrote:

> > Am I missing something ?  
> 
> No. I missed the libusb-0.1 related symbols in configure.ac and 
> plugins/Makefile.am.
> 
> Marked as rejected.

OK, thanks for confirming. FYI, when I saw your patch, I looked at the
Git log on this package, and found a commit from Bernd adding
the LIBUSB_COMPAT optional dependency, with a commit log saying that it
is referenced in configure.ac. That's how I started to have some doubts
on your patch :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
