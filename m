From: Nigel Sollars <nsollars@gmail.com>
Date: Mon, 21 Jan 2013 12:02:02 -0500
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <20130119000053.3f7eebc1@skate>
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
Message-ID: <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Confirmed the config file as per menuconfig from the git checkout is still
pointing to the older location.

Regards
Nigel

On Fri, Jan 18, 2013 at 6:00 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Nigel Sollars,
>
> On Fri, 18 Jan 2013 16:03:43 -0500, Nigel Sollars wrote:
>
> > Something odd for sure, I took a look on the interwebs and made sure all
> > was well with my selections.
> >
> > Basically whats happening is it seems that
> target/generic/device_table.txt
> > is not getting created the build / final then errors with a No such file
> or
> > directory.
>
> This file has changed location, it is now in system/device_table.txt.
> It might be that your configuration file still references the file in
> its old location. Could you check this?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/1d8ae0b8/attachment.html>
