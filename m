From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 13:24:07 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <20100623131259.291a1735@surf> (Thomas Petazzoni's message of
	"Wed, 23 Jun 2010 13:12:59 +0200")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
	<874ogu6vsv.fsf@macbook.be.48ers.dk> <20100623104613.78fe0d97@surf>
	<87vd9a5bvy.fsf@macbook.be.48ers.dk> <20100623115141.0bf70116@surf>
	<87r5jy5aof.fsf@macbook.be.48ers.dk> <20100623131259.291a1735@surf>
Message-ID: <87mxum56w8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 23 Jun 2010 12:02:24 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 Thomas> So, what would be the conclusion of this ?
 >> 
 >> Give the wrappers a try, I would say.

 Thomas> Toolchain utilities in a separate directory + wrappers, or just
 Thomas> wrappers ?

Both, then you cannot use it "wrongly", and we get to test the external
toolchain (E.G. -sysroot) stuff more.

-- 
Bye, Peter Korsgaard
