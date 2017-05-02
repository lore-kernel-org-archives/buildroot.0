From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 08:51:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-30
In-Reply-To: <639b7947-cb49-8915-78fc-a16643a259ab@posteo.de>
References: <20170501062807.07CDF2075C@mail.free-electrons.com>
 <639b7947-cb49-8915-78fc-a16643a259ab@posteo.de>
Message-ID: <20170502085101.327b163e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 May 2017 19:30:09 +0200, Martin Kepplinger wrote:

> > Build failures related to your packages:
> > 
> >          arm |                  x11vnc-0.9.14 | http://autobuild.buildroot.net/results/e62decaf38b44306ab5e0c66bc3033c9de91a6cd  
> 
> I quickly took the config from the autobuild (removed some parts to
> speed up the build) but can't reproduce this.

According to
http://autobuild.buildroot.net/results/e62/e62decaf38b44306ab5e0c66bc3033c9de91a6cd/gitid,
this build was done at commit f7e7bf72a7ddbd72041090ae6ba97778f7b96948,
which is *before* your "package/x11vnc: add dependency on libvncserver"
was committed/pushed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
