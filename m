From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 20 Nov 2013 11:38:32 +0100
Subject: [Buildroot] autobuild annotations
In-Reply-To: <CAAXf6LUcR-P7rrpiBOELDV=3GZNHn3kU9hu8bg63+xOZWs0u0Q@mail.gmail.com>
References: <CAAXf6LUcR-P7rrpiBOELDV=3GZNHn3kU9hu8bg63+xOZWs0u0Q@mail.gmail.com>
Message-ID: <CACjG4BL-99HruiHb48fwSD2PV+uCyUkvOra8zsyyTt7dWhxrvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

You're right I think there is something missing in the current workflow.
I was wondering if Jenkins can be used to solve this problem and bring some
meatrics and code conventions checking.

I noticed that free-electrons has a Jenkins instance building buildroot :
http://jenkins.free-electrons.com/job/buildroot/ is it used by the
community too ?
.
I think the advantage of Jenkins against the current flow is that there is
plenty of plugins that can be (easily?) used to fulfil the project needs
(comment on failure, meatrics, code convention checking...)
Did you ever talk about that ?

Regards,

Arnaud



2013/11/20 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> Hi,
>
> What I am missing in the current autobuild website/flow is a way to
> indicate that a certain problem is already analyzed by someone, and
> what the problem is. Maybe a patch has been submitted already and
> waiting to be merged. Maybe the solution is clear but someone still
> needs to make a patch. Maybe it's more complex and we have to wait for
> feedback from upstream.
>
> If we could have such a 'comment' or 'annotations' field, we could
> avoid duplicating the analyis / resolution effort.
>
> One way to proceed is to simply keep a comment for each package. When
> there is a failure, we show (or link to) the comment for that package,
> even though at that time we are not yet sure that the problem is
> exactly the same (one package could fail in multiple ways). The
> comment should have a link to the problem on which it was added
> originally, so that the developer looking at the new problem can
> analyze if it is the same problem or not.
>
> To implement this, we'd need an extra table in the database to map a
> package to a comment, and we need a query to extract the comments for
> a given package from that table when displaying the results.
>
> What do you think?
> Do you have alternative proposals?
>
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/ea16414b/attachment.html>
