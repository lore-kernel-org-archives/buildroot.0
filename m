From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Nov 2011 21:15:46 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111102160349.4afe5935@skate> (Thomas Petazzoni's message of
 "Wed, 2 Nov 2011 16:03:49 +0100")
References: <20111102160349.4afe5935@skate>
Message-ID: <87liryjn65.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Buildroot Developer Day - ELCE 2011
 Thomas> ===================================

 Thomas> The Embedded Linux Conference Europe 2011 took place from Wednesday
 Thomas> October, 26th to Friday October, 28th in Prague. The Buildroot
 Thomas> developers took that opportunity to organize a one day meeting on
 Thomas> Saturday October, 29th. The meeting took place in the lobby of the
 Thomas> Clarion Congress Hotel, where the rest of the conference took place.

Thanks a lot for the writeup Thomas!

 Thomas>  * The development process has a 3 months cycle, with 2 months of
 Thomas>    development and 1 month of bug-fixing. During the month of
 Thomas>    bug-fixing, Peter only accepts bug fix patches and other minor
 Thomas>    evolutions. This means that the merge of more invasive patches is
 Thomas>    completely stalled during one month and those patches accumulate
 Thomas>    and it is difficult for Peter to merge them all when the next
 Thomas>    development cycle opens. To solve this, Peter will now maintain a
 Thomas>    -next branch during the month of bug-fixing. This way, Peter will
 Thomas>    continue to merge the patches non-acceptable during the bug-fixing
 Thomas>    period, and all those patches would be merged into the master
 Thomas>    branch as soon as the next development cycle starts.

Which means I'm running late for 2011.11-rc1 because of ELCE and other
real life stuff. I was hoping to be able to put out rc1 today, as I'll
be away for the rest of the week - But that's not going to happen.

Expect rc1 early next week instead. If you have any pending patches you
think should go into rc1, please ping me.

Once rc1 is out, then I'll create the -next branch and start merging in
new stuff.

-- 
Bye, Peter Korsgaard
