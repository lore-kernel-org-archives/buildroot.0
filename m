From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 4 Sep 2007 23:24:17 +0200
Subject: [Buildroot] Adding new package to toolchain, target or both ?
In-Reply-To: <1188900457.4793.13.camel@localhost.hobsite.be>
References: <1188900457.4793.13.camel@localhost.hobsite.be>
Message-ID: <20070904212417.GX11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 04, 2007 at 12:07:37PM +0200, Johan De Wit wrote:
>Hi,
>
>I'm trying to build an embedded system using buildroot to be used in an
>arcade cabinet, using svgalib and advancemame.  
>
>Since svgalib is not only needed at 'runtime' in the target as dynamic
>library adn/or utility programs, I also need the some files to compile
>eg. advmame.  I suspect i have to add these to the toolchain to keep the

sort of. See libpcap/tcpdump for such an example. The lib is built and
installed into the staging_dir, the app is built using the stuff from
staging_dir and is finally installed to the target(_dir).

>target clean.  I'm still in doubt if my 'logic' is correct and would be
>glad if someone could give some advice on this issue.

HTH,
Bernhard
