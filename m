From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 23 Apr 2015 01:02:34 +0300
Subject: [Buildroot] [RFC v2 0/5] common service startup files
In-Reply-To: <20150422231143.2b2921e2@free-electrons.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
 <20150422231143.2b2921e2@free-electrons.com>
Message-ID: <20150422220234.GA11809@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wed, Apr 22, 2015 at 11:11:43PM +0200, Thomas Petazzoni wrote:

> Thanks for this proposal. However, as you have seen, the general
> feedback was not very positive. We don't really like having a
> specialized language being created for Buildroot, so the overall
> approach doesn't really match the "spirit" of how things are done in
> Buildroot.
> 
> I've marked the corresponding patches as rejected in our patch tracking
> system.

Ok, yeah, the initial reaction was pretty clear and I thought it has been
marked as rejected for several weeks already. Looks like it wasn't,
so people got those patch reminders and started replying.

-*--

And a kind of follow-up: I've got a bunch of systemd service files
as a by-product of this effort, some of them for packages that
have no systemd hooks at present.

If you're interested, I could either upload them somewhere
for you to pick up, or alternatively start sending patches myself.
One package at a time, without any global infrastructure changes.
