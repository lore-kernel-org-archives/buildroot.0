From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 19:13:21 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <1231262543.32308.189.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 18\:22\:23 +0100")
References: <20090103000614.1DC5F769FA@busybox.osuosl.org>
	<87mye4qz4d.fsf@macbook.be.48ers.dk>
	<1231255007.32308.107.camel@elrond.atmel.com>
	<874p0cpiau.fsf@macbook.be.48ers.dk>
	<1231257412.32308.148.camel@elrond.atmel.com>
	<87vdsso1bx.fsf@macbook.be.48ers.dk>
	<1231262543.32308.189.camel@elrond.atmel.com>
Message-ID: <87bpuknvzy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> If you want to avoid cluttering the u-boot directory
 Ulf> with patches, then it is of course a possibility
 Ulf> to apply all patches and store the tarball on $(ATMEL_MIRROR)
 Ulf> That will make the patches harder to maintain and 
 Ulf> it will take longer to get them into mainline.

Why? Having them in buildroot or not seems pretty unrelated to their
upstream acceptance or not.

-- 
Bye, Peter Korsgaard
