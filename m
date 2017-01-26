From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 26 Jan 2017 10:43:22 +0100
Subject: [Buildroot] [PATCH v2] throttle: new package
In-Reply-To: <20170125233949.10454b42@free-electrons.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
 <1483371929-13907-7-git-send-email-david.bachelart@bbright.com>
 <20170125233949.10454b42@free-electrons.com>
Message-ID: <CAJeZidL10bF23Vyz40WN7uh_51hOt5XMqkwpy_FACFmDaRip6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

You are right. My patch is now archived.

Best regards,

David Bachelart

2017-01-25 11:39 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon,  2 Jan 2017 16:45:28 +0100, David Bachelart wrote:
> > From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> >
> > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
>
> Do we really want to add a Buildroot package for this?
>
> Fedora has declared this as orphaned:
> http://pkgs.fedoraproject.org/cgit/rpms/throttle.git/commit/?id=
> 9a1fc2806fab0b2f0a51172b4a9bf05a8c2af23e.
> Debian has decided that the upstream project was dead, and therefore
> refused to package it:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=426891. And indeed
> the original upstream site at http://klicman.org/throttle/ doesn't
> exist anymore.
>
> So unless there's a new upstream, I would suggest that we do not
> package this in Buildroot.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170126/24558180/attachment.html>
