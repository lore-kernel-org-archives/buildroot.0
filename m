From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 22:38:12 +0200
Subject: [Buildroot] [PATCH 04/14] expand arch selection
In-Reply-To: <873a5vkl72.fsf@macbook.be.48ers.dk>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<873a5vkl72.fsf@macbook.be.48ers.dk>
Message-ID: <20091007203812.GG23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 10:23:13PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>This one still contains a lot of unrelated stuff. Could you please split
>it up in something like:
>
>- add bfin
>- update m68k support
>- update cris support
>- add s390
>- certain options should depend on finegrainedmtune
>- ...
>
>That would make reviewing a lot easier.

It is one logical change, splitting them into individual parts is too
cumbersome for me right now. I've even left out default cpu tuning
(forgot to do an intermittent commit and synced some more in the
meantime which is not pushed yet).
