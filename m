From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 20 Jan 2009 12:49:19 +0100
Subject: [Buildroot] tslib puts staging_dir into pkgconfig file
In-Reply-To: <8763kaxqrg.fsf@macbook.be.48ers.dk>
References: <1232382648.8906.11.camel@sven> <20090120070239.53b5e464@hcegtvedt>
	<8763kaxqrg.fsf@macbook.be.48ers.dk>
Message-ID: <1232452159.6666.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-01-20 at 10:37 +0100, Peter Korsgaard wrote:
> >>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  Hans-Christian> Why not just convert it to Makefile.autotools.in?
> 
> My thoughts exactly.

Yeah, why not :)  Attached is a patch that does this. Seems to work
nicely for me.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: tslib-autotools.diff
Type: text/x-patch
Size: 4323 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090120/060521bb/attachment.bin 
