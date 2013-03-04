From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 21:14:40 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <946118.25355.bm@smtp119.mail.ird.yahoo.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <87ppzf9d2h.fsf@dell.be.48ers.dk>
 <946118.25355.bm@smtp119.mail.ird.yahoo.com>
Message-ID: <20130304211440.1b5e2c03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kevin Chadwick,

On Mon, 4 Mar 2013 19:52:09 +0000, Kevin Chadwick wrote:

> It's worth bearing in mind however that in the long run and if eudev is
> still around then I would expect (2) to be by far the best option for
> their reduced dependencies, older kernel support and just general
> all round sane and considerate decision making.

We already have support for static /dev, devtmpfs or mdev, and none of
those options require *any* dependency beyond some basic kernel options
and Busybox. So for anyone looking for a lightweight solution, we
already have plenty of choices.

> It's been a few weeks since I checked, is eudev considered stable yet.
> When it is I'd say (2) definately.
> 
> Why not both. I don't believe there is too much difference? and eudev
> is tracking udev but less so the other way around I believe.

If someone contributes sane patches that implement both systemd-udev
and eudev, then we will of course review them and consider them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
