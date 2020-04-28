From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:32:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
In-Reply-To: <CADvTj4oPoCyiZLt+h7Wft6eF27E-pRtOzO+68M=o5276NDRWCw@mail.gmail.com>
References: <20200428040638.122494-1-james.hilliard1@gmail.com>
 <20200428072202.5889620f@windsurf.home>
 <CADvTj4oPoCyiZLt+h7Wft6eF27E-pRtOzO+68M=o5276NDRWCw@mail.gmail.com>
Message-ID: <20200428073214.6b598767@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 23:28:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Could you have a look at the patch below? My understanding is that your
> > commit 4e0bc29993376613d200e892d491e31ea5a49622 should have made this
> > unnecessary. Could you comment ?  
> I've confirmed with upstream that this option can only be passed via
> command line
> and not via cross-compilation.conf at the moment so I'm fairly confident that
> 4e0bc29993376613d200e892d491e31ea5a49622 would not fix this issue.

But then I wonder what is the point of
4e0bc29993376613d200e892d491e31ea5a49622 and how it can have worked ?

Or is it necessary *in* addition to passing -Dbuild.pkg_config_path ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
