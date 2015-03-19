From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 15:43:39 -0400
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
Message-ID: <CANPyyuO9hfyObgWWPjh7m=oghSs=qWWvsG28q+P=7F8W4NQnYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I come from the Arch Linux world, so I made a new skeleton that
> matches the Arch base filesystem layout: with /bin, /sbin, /usr/bin,
> and /usr/sbin all unified (likewise with /lib and /usr/lib). I haven't
> convinced myself to post the series because I can't think of a
> particularly good justification for it in the Buildroot context.

I'm working that way myself, I don't know what use cases in Buildroot
still require the split.
