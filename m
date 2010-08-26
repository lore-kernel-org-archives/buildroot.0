From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 26 Aug 2010 19:50:49 +0200
Subject: [Buildroot] How and where to get these patches
In-Reply-To: <KAW101-W118043CFAFF48A0AE67C729B850@phx.gbl>
References: <KAW101-W118043CFAFF48A0AE67C729B850@phx.gbl>
Message-ID: <20100826175049.GA5877@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 27, 2010 at 02:30:32AM +0900, S W wrote:
> 
> Hi
> 
> I am new to Buildroot.
> I tried to build Linux kernel for ARM9, but I got
> the following error message.
> 
> "no patch in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
> You must install 'patch' on your build machine"
> 
> Could anybody please tell me how to get those paches?
> I don't even know what patches are needed?

"patch" is a binary that the build system uses.
So you need to install the package that contains "patch",
and how to do so depend on your distribution.

When you miss "patch" I guess that you will miss a lot
of other fundamental utilities.
Please see if you can find some high-level development package to install,
so you get gcc, binutils, flex, bison etc. installed in one go.

	Sam
