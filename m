From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 4 Apr 2007 22:29:35 +0200
Subject: [Buildroot] adding applications
In-Reply-To: <1F5308C5923F3B4DAA51D189BF255006021B3ABD@edgmsmail01.eu.thmulti.com>
References: <1F5308C5923F3B4DAA51D189BF255006021B3ABD@edgmsmail01.eu.thmulti.com>
Message-ID: <20070404202935.GA9924@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 04, 2007 at 02:41:46PM +0200, Geerts Steven wrote:
>All
>
> 
>
>I would like to know how I can add dependencies when building extra
>packages.
>
> 
>
>For example I need to build an appilication, but before building this
>application I need to have a certain library.  Is this been taking care
>of by buildroot or do I need to specify this.
>
> 
>
>Is the following possible to be sure that the libxxx is build before
>building the test application?
>
>ifeq ($(strip $(BR2_PACKAGE_TEST)),y)
>
>TARGETS+= libxxx test
>
>Endif
>
> 
>
>Or is this specified in the Config.in?

first, you sent that question to the busybox list where the buildroot
list would have been the proper place ;)

second, see e.g. dialog and it's dependency on ncurses as a reference.

HTH,
