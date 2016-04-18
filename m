From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 09:07:41 +0200
Subject: [Buildroot] [PATCH 1/1] flatcc: new package
In-Reply-To: <57140E40.9040700@mind.be>
References: <1460769824-19461-1-git-send-email-steve.derosier@lairdtech.com>
 <57140E40.9040700@mind.be>
Message-ID: <20160418090741.75aa988a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 00:29:20 +0200, Arnout Vandecappelle wrote:

> > +define HOST_FLATCC_INSTALL_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/bin/flatcc $(HOST_DIR)/usr/bin/flatcc
> 
>   I was going to say: this shouldn't be needed - but in fact it is, it looks 
> like they have a weird CMakeLists.txt that doesn't even have an 'install' 
> target... Se yes, this is needed.

Then this definitely calls for a comment that explains why this is
needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
