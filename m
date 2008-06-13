From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 14 Jun 2008 00:09:23 +1000
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <1213361084.10637.18.camel@kokopelli>
References: <20080611161156.33737116@crazy>
	<200806130824.42363.buildroot.atmel.com@pollet.net>
	<87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
	<20080613120529.GB31396@cloud.net.au>
	<1213361084.10637.18.camel@kokopelli>
Message-ID: <20080613140923.GA4318@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 05:44:44AM -0700, Brian Beattie wrote:
> On Fri, 2008-06-13 at 22:05 +1000, Hamish Moffatt wrote:
> 
> > Personally even though I have commit access I think it is still good to
> > discuss anything remotely controversial before committing it. Most
> > changes (new packages, package updates) don't fall in that category of
> > course.
> 
> I have a change I'd love to discuss.  I have asked twice now about the
> correct place to add support for a new board and have received no
> response whatever.
> 
> This makes me sceptical of even trying to submit a patch.
> 
> try #3, I would like to add support for a board from KwikByte based on
> the at91rm9200 processor. should I add it to target/device/Atmel or
> should I create a new directory target/device/KwikByte or some other
> location.
> 
> I have a patch for the first option.

I don't know the answer.
Is the board made by Atmel or some other vendor? Are the other boards in
target/device/Atmel all made by Atmel or a mix of vendors? I guess it
should follow the lead of the other boards.

The Atmel guys seem to be suggesting it should go in
target/device/KwikByte.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
