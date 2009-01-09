From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 09 Jan 2009 18:42:32 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090109102959.GA24375@mx.loc>
References: <20090108225832.382AD77108@busybox.osuosl.org>
	<87ljtkrg83.fsf@macbook.be.48ers.dk> <20090109112116.63cb1701@surf>
	<20090109102959.GA24375@mx.loc>
Message-ID: <1231522952.9711.35.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-09 klockan 11:29 +0100 skrev Bernhard Reutner-Fischer:
> On Fri, Jan 09, 2009 at 11:21:16AM +0100, Thomas Petazzoni wrote:
> 
> >I think we should stop mixing host and target binaries and libraries in
> >$(STAGING_DIR). But that's another story :-)
> 
> Very true indeed. Host binaries are supposed to live in
> $(TOOL_BUILD_DIR)/bin, i will remember to fix that up.

I was not at all happy with $(STAGING_DIR)/usr/bin,
where mkimage currently resides due to mixed binaries-
I guess $(TOOL_BUILD_DIR)/bin is probably fine.
mkimage shoudl be put ther in the first place in 
the u-boot build.



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
