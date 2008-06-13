From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Jun 2008 22:05:29 +1000
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
References: <20080611161156.33737116@crazy>
	<200806130824.42363.buildroot.atmel.com@pollet.net>
	<87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
Message-ID: <20080613120529.GB31396@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 12:07:42PM +0100, Will Newton wrote:
> I must confess that has been my experience too. I tried asking Erik
> for commit access but again, no response. Perhaps he is working on
> other projects?

I think anyone wanting write access should send some patches here first
for review. I guess you already did this -- I don't recall sorry.

Personally even though I have commit access I think it is still good to
discuss anything remotely controversial before committing it. Most
changes (new packages, package updates) don't fall in that category of
course.

> It's a hard balance to strike, I don't think it's right to demand
> anything of people on a volunteer led project but some of us have a
> job to do and a limited amount of time to do it in.

Does your job require your changes to be committed to the master
repository?

Personally I am using buildroot in a commercial product for my day job.
I am contributing everything that is relevant back to the buildroot
repository, but we have some changes specific to our application and
some proprietary packages which will never be merged. We don't expect to
be able to build our whole product directly from the
buildroot.uclibc.org repository.

I'm committing my own changes back to the master repository where
relevant, and I commit patches from this mailing list in areas that are
relevant to me and where I think I can properly review them.
Unfortunately I don't have company time to work on parts of buildroot
that fall outside these categories.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
