From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 25 Jul 2011 17:11:53 -0400
Subject: [Buildroot] [PATCH] inotify-tools: Add new package
In-Reply-To: <CANPyyuOjm8U6osYRJWZKwWpRFJFQ1GXGjMJEA4TgG3oYH9MZGg@mail.gmail.com>
References: <1311626319-19243-1-git-send-email-mike@mikebwilliams.com>
 <87ei1e13pm.fsf@macbook.be.48ers.dk>
 <CANPyyuOjm8U6osYRJWZKwWpRFJFQ1GXGjMJEA4TgG3oYH9MZGg@mail.gmail.com>
Message-ID: <CANPyyuOZNEDTvPnUKKDn7LJG_k=ycEFN2BfZG9aSZrHhse=U6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Thanks for taking the time to review this so quickly.

> ?Mike> Adds support for inotify-tools, which are useful for scripting the
> ?Mike> Linux inotify API.
>
> Thanks, see below for a few comments.
>
> First of all, are you aware of busybox's inotifyd? From a quick look it
> seems to do more-or-less the same as these.

I was not (I did the lazy thing and searched through the buildroot
package menus only). However, it doesn't mention automatically
monitoring subdirectories that are created, which I need, so these
tools appear to still be necessary.


> Otherwise it looks good, thanks. Care to fix and resend?

Sure, I'll try to get it done ASAP.

Thanks,
Mike
