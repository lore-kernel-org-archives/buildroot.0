From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 26 Feb 2009 17:04:11 +0100
Subject: [Buildroot] [Bug 101] New: update gstreamer packages
In-Reply-To: <COL102-DS38E057154929657A976F2DCAD0@phx.gbl>
References: <bug-101-163@https.bugs.busybox.net/>
	<COL102-DS38E057154929657A976F2DCAD0@phx.gbl>
Message-ID: <1235664251.8232.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-02-26 at 15:53 +0000, Daniel Laird wrote:
> I tried to use this patch and could not get it to work.  The reason appears
> to be that they have moved on some libtool version in the gstreamer packages
> which means the LIBTOOL_PATCH cannot be set to YES.  This means that it then
> starts linking against my host libraries rather than my STAGING_DIR/ mips
> based libraries and unsurprisingly the linker gives up.
> 
> If anyone has succesfully built this package using a cross compiler (ideally
> external toolchain) I would love to know how you did it because I had real
> trouble.

All I can say is that it works for me and my colleagues. We are building
for an ARM platform using the uclibc/gcc toolchain that is selected by
default.


Sven
