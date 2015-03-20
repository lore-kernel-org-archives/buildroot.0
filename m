From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:34:43 +0100
Subject: [Buildroot] [PATCH] package: add pacman 4.2.1
In-Reply-To: <CAKbGBLiyLf4JgiTrgN=w8YQu5xAgYHmt0UWysRGYxhjNWJjZeg@mail.gmail.com>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
 <20150320205209.2830b9bc@free-electrons.com>
 <CAKbGBLiyLf4JgiTrgN=w8YQu5xAgYHmt0UWysRGYxhjNWJjZeg@mail.gmail.com>
Message-ID: <20150320213443.7dcf4817@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Fri, 20 Mar 2015 13:18:46 -0700, Steven Noonan wrote:

> > In addition to the comments made by Baruch, could you also include in
> > the commit log a motivation for adding this package in Buildroot?
> >
> > It seems a bit weird to package the package manager of another distro.
> 
> Why do we have RPM then? :)

Well, to be honest I don't know how rpm compares to pacman. I believe
the reason we have rpm and opkg is because some people might build
their own binary packages (outside of Buildroot, since Buildroot
doesn't allow building binary packages), and install them inside a
Buildroot system.

> If we don't want it in there I have no problem maintaining it in my
> own tree.

Well, it's that we don't want it, the package seems pretty simple, so
it's not that a big issue. It's just that it's a bit unusual, and some
explanations about the use case would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
