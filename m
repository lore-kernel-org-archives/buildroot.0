From: Diego Iastrubni <diegoiast@gmail.com>
Date: Fri, 12 Aug 2011 02:10:46 +0300
Subject: [Buildroot] $udevroot
In-Reply-To: <1313073148.31365.9.camel@sven>
References: <1313073148.31365.9.camel@sven>
Message-ID: <CALR4fEJk7-YRUTOJuMmJ=EgWFhcjVO4=iztRBapYrPfbNFEYdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 11, 2011 at 5:32 PM, Sven Neumann <s.neumann@raumfeld.com>wrote:

> Hi,
>
> we are facing some problems with device nodes since the udev update. Now
> I am trying to understand how the whole device management works
> nowadays.
>
> First thing that made me wonder is the following output on startup:
>
> Populating  using udev: done
>
> This is from /etc/init.d/S10udev and it looks like $udevroot is not set
> here. Is that just a cosmetic issue or an indicator that something is
> severily broken?
>

Please add "udevadm trigger" after running udev, and tell us if this works.
This worked for me, and if this fixes it for you, we can add it to the git
repository.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110812/f8d238e7/attachment.html>
