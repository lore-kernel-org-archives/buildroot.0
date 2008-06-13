From: Will Newton <will.newton@gmail.com>
Date: Fri, 13 Jun 2008 13:40:03 +0100
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <20080613120529.GB31396@cloud.net.au>
References: <20080611161156.33737116@crazy>
	<200806130824.42363.buildroot.atmel.com@pollet.net>
	<87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
	<20080613120529.GB31396@cloud.net.au>
Message-ID: <87a5b0800806130540w489cef52r8f5e7bddc0ae45b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 1:05 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Fri, Jun 13, 2008 at 12:07:42PM +0100, Will Newton wrote:
>> I must confess that has been my experience too. I tried asking Erik
>> for commit access but again, no response. Perhaps he is working on
>> other projects?
>
> I think anyone wanting write access should send some patches here first
> for review. I guess you already did this -- I don't recall sorry.

I did send patches. I took the lack of response as "everyone is too
busy right now", and because in our company we've been using and
patching buildroot for a few years I though it reasonable to offer
some assistance in that regard.

> Personally even though I have commit access I think it is still good to
> discuss anything remotely controversial before committing it. Most
> changes (new packages, package updates) don't fall in that category of
> course.

Patch review is certainly a good thing.

>> It's a hard balance to strike, I don't think it's right to demand
>> anything of people on a volunteer led project but some of us have a
>> job to do and a limited amount of time to do it in.
>
> Does your job require your changes to be committed to the master
> repository?
>
> Personally I am using buildroot in a commercial product for my day job.
> I am contributing everything that is relevant back to the buildroot
> repository, but we have some changes specific to our application and
> some proprietary packages which will never be merged. We don't expect to
> be able to build our whole product directly from the
> buildroot.uclibc.org repository.
>
> I'm committing my own changes back to the master repository where
> relevant, and I commit patches from this mailing list in areas that are
> relevant to me and where I think I can properly review them.
> Unfortunately I don't have company time to work on parts of buildroot
> that fall outside these categories.

I'm in a similar situation. We have a snapshot of buildroot that is
patched for our needs. I would like to be able to contribute as much
as possible back however, because it makes my life easier and helps
the project as a whole. For example, some time ago I wrote some
makefiles for glib 2.x when at the time there was only glib 1.2
support in buildroot. I kept meaning to push these back upstream but
never got round to it. Someone else did however, which left me with a
difficult merge to do and duplicated effort.
