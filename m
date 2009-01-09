From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Jan 2009 11:29:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090109112116.63cb1701@surf>
References: <20090108225832.382AD77108@busybox.osuosl.org>
	<87ljtkrg83.fsf@macbook.be.48ers.dk> <20090109112116.63cb1701@surf>
Message-ID: <20090109102959.GA24375@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 09, 2009 at 11:21:16AM +0100, Thomas Petazzoni wrote:

>I think we should stop mixing host and target binaries and libraries in
>$(STAGING_DIR). But that's another story :-)

Very true indeed. Host binaries are supposed to live in
$(TOOL_BUILD_DIR)/bin, i will remember to fix that up.
