From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 07 Sep 2020 17:57:20 +0200
Subject: [Buildroot] =?utf-8?q?More_maintainers?=
In-Reply-To: <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
Message-ID: <53-5f565880-11-65fee200@257788444>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I want to add the "Buildroot User" perspective onto the whole Mailinglist centered approach.
I subscribed to the Mailinglist and started to contribute patches pretty recently.
But I have been an active BR User for a few years now. So I happened to file some bug reports
before. It happens there is still a report open from roughly a year ago:

https://bugs.busybox.net/show_bug.cgi?id=12301

What I want to point out at this example: Thomas added a link to the Mailinglist which
I followed when it was added. But afterwards lost track of it because the ticket didn't get any
updates (and I could mitigate the issue so it priority was low for me). I see now there 
was indeed some discussion which didn't lead to a fix because (I guess) time/priorities.

So as a User I've got pretty low interest to subscribe to a ML which has a pretty high volume with stuff
that doesn't bother me. I can't 'subscribe' to certain threads in a sensible way other than getting
people to put me in cc for mails. Further: when I see that an issue that I file via the bugtracker is 
discussed on the ML I have no clear way of responding to the discussion (when I'm not interested in
finding out how to get a Mailclient to send a mail to the list with a specific reply-to header, which
is after I found out how to send properly formatted text only mails).
(And I still don't know how I could pick up the ML discussion from a year ago...)

Which leads me to another point: When I want to see what the known issues with the current BR Version
are I have a pretty long way to go. Because the bugtracker itself is a silo which feeds into the ML, but
the ML doesn't feed back. So if I have a problem with a certain package I might find something in the
tracker, but the information might also be somewhere in the ML. Which leads me to another point:
Searchability of the ML. The kernel has this lore system which offers a text search. From what I know
BR doesn't offer that. So what is the normal way to search the ML archive? Google Foo?

So from a user standpoint I also see some room of improvement for tooling around bug reporting/tracking.

I totally see how it is an advantage of having all the projects Metadata in mbox files which gives you total
control. But I fear it requires a lot of hard work and tools to mirror a user experience with a platform
approach like github/gitlab.

Btw. I love that there is a discussion around adding some automated Patch checking. I recently sent a
patch to BlueZ and got pretty instantly a bot response which told me that my reference to a commit
was ill formatted. That's pretty nice. Hope something like this is possible for BR too.

Regards,
Michael
 
On Thursday, September 03, 2020 17:44 CEST, Avraham Shukron <avraham.shukron@gmail.com> wrote: 
 
> On Thu, Sep 3, 2020, 01:20 Christian Stewart <christian@paral.in> wrote:
> 
> > Discoverability is a problem right now, there's too many patches and
> > no way to subscribe to a given series for further updates (similar to
> > Pull Requests on GitHub), unless the submitter happens to add you to
> > the CC list - which, by the way, usually happens if you add a review.
> >
> > Today, probably the best approach is to hunt through the backlog
> > (sorted by reviewed-by priority order) and cherry-pick some of these
> > series into downstream, more "experimental" repositories. Then, once
> > they've been tested there, you can submit a Reviewed-By back upstream
> > to indicate that it was useful and worth merging more urgently.
> >
> 
> For what it's worth I think that the mail-based contribution process is
> part of the problem.
> With a decent Git server like GitHub/GitLab patches could be reviewed more
> easily.
> A CI pipeline could run tests that will give immediate feedback for any
> pull request.
> More importantly, it'll dramatically reduce the barrier for new and young
> contributors.
> 
> Buildroot is all about using simple and familiar tools like make and
> Kconfig, and I personally think that this principle should also be applied
> to the contribution process and right now buildroot is one of the last
> active open source projects using the mailing list approach.
> 
> >
