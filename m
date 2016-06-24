From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 22:58:21 +0200
Subject: [Buildroot] [git commit] package/gtest: add and install a .pc
 file
In-Reply-To: <3df7f810-2080-6baa-e4f0-82d70fb00154@smile.fr>
References: <20160624160016.5DA6181EB2@busybox.osuosl.org>
 <3df7f810-2080-6baa-e4f0-82d70fb00154@smile.fr>
Message-ID: <20160624225821.57dfaa77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 19:56:32 +0200, Romain Naour wrote:

> > +	$(INSTALL) -D -m 0644 packages/gtest/gtest.pc \  
>                                     ^^
> s/packages/package/

Thanks for spotting, I fixed it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
