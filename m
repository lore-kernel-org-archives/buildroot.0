From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:32:08 +0100
Subject: [Buildroot] [PATCH/next v2 3/3] package/python-mwclient: bump
 version to 0.8.6
In-Reply-To: <CAGm1_ku9aHQYXjEX1zP9O85weDgYjHG9jvmqk+8J1H7bB61nhA@mail.gmail.com>
References: <20171112104523.16791-1-bernd.kuhls@t-online.de>
 <20171112104523.16791-3-bernd.kuhls@t-online.de>
 <20171124152816.021c5ae6@windsurf.lan>
 <CAGm1_ku9aHQYXjEX1zP9O85weDgYjHG9jvmqk+8J1H7bB61nhA@mail.gmail.com>
Message-ID: <20171124213208.0e784d54@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Nov 2017 20:12:15 +0100, Yegor Yefremov wrote:

> > Apparently this update is causing a new build failure:
> > http://autobuild.buildroot.net/results/79e/79ef04d2e8c91231028e23f4bb35df685efa55ca/build-end.log.
> >
> > Could you have a look?
> >
> > Thanks a lot!  
> 
> I've opened an issue [1]
> 
> [1] https://github.com/mwclient/mwclient/issues/179

Thanks. However, Bernd has submitted a patch that apparently fixes this
problem: https://patchwork.ozlabs.org/patch/841159/. It looks sane to
me, but I'm not a Python packaging expert. Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
