From: Ram kumar <ramkumar.research@gmail.com>
Date: Mon, 9 Jun 2008 10:58:49 -0700
Subject: [Buildroot] Target's /sys directory not created by buildroot
In-Reply-To: <87a5b0800806091044j30cd1de8x82f3a0f634fdf0ec@mail.gmail.com>
References: <6306c640806061655t6be09c97ud175dfdcf0fa82e6@mail.gmail.com>
	<014b01c8ca0b$f32a0f10$080514ac@atmel.com>
	<6306c640806090951y365d4ca4o7a093129342eceb2@mail.gmail.com>
	<87a5b0800806091044j30cd1de8x82f3a0f634fdf0ec@mail.gmail.com>
Message-ID: <6306c640806091058l71f30ca0mde94840308177979@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

I have added this line below /etc entry in my device_table.txt even then the
buildroot is not able to create a directory.....

/etc        d    755    0    0    -    -    -    -    -
/sys        d     755    0    0    -    -    -    -    -

Please suggest how to make the builroot create /sys directory......? when it
builds...!!!

Regards,
Ram

On Mon, Jun 9, 2008 at 10:44 AM, Will Newton <will.newton@gmail.com> wrote:

> On Mon, Jun 9, 2008 at 5:51 PM, Ram kumar <ramkumar.research@gmail.com>
> wrote:
> > hi,
> >
> >>
> >> Your build is using another target_skeleton
> >>
> >>
> >
> > I have not enabled the busybox target skeleton in the menuconfig.I have
> not
> > enabled the "use minimal target skeleton" option.
> >
> > Please suggest how to get the /sys directory created in the root
> > filesystem.....
>
> I've added an entry for /sys to my device_table.txt, although the
> snapshot of buildroot I use is a little old now.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080609/f9ee0eb3/attachment.htm 
