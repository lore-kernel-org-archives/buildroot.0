From: Stephen Turner <artic.knight31337@gmail.com>
Date: Thu, 21 Feb 2013 10:43:56 -0500
Subject: [Buildroot] network-manager-applet for buildroot almost ready
In-Reply-To: <51263203.4070709@petroprogram.com>
References: <51263203.4070709@petroprogram.com>
Message-ID: <CAN_xxrXpuxK+5JwR7_QeqryFRsEPRgFbdVFs2mSqf_0rLdX5qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When i try using network manager It completely dissapears from the make
menu. if i do not have ipv6 support it has a place holder saying your
missing blah but if i include all dependencies its no longer available? a
bit different from the issue you guys are having but maybe its a bug then?
or is my issue user error? i was running with the latest git repository as
of yesterday.

On Thu, Feb 21, 2013 at 9:41 AM, Stefan Fr?berg <
stefan.froberg@petroprogram.com> wrote:

> Hello all!
>
> I have network-manager-applet running and it appears into fluxbox system
> tray but
> it does not detect any networks.
>
> When starting it from terminal it spits the following:
>
> ** Message: applet now removed from the notification area
> ** Message: applet now embedded in the notification area
>
> ** (nm-applet:766): WARNING **: Failed to register as an agent: (32) No
> session found for uid 0
>
> Does that "No session found for uid 0" mean that there is something
> wrong with dbus ????
>
> Or is that error related to consolekit ?
>
> I have it here running too (and soon will submit to buildroot)
> Also running are NetworkManager and dbus.
>
> I start fluxbox with normal startx command and I have just "exec
> /usr/bin/startfluxbox" in my .xinitrc file.
>
>
> Regards
> Stefan
>
>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130221/77b8f66d/attachment.html>
