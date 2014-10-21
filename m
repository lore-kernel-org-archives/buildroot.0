From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 21 Oct 2014 09:58:54 +0200
Subject: [Buildroot] [PATCH] eudev: add input group
In-Reply-To: <20141020231802.204b1e27@free-electrons.com>
References: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020231802.204b1e27@free-electrons.com>
Message-ID: <20141021075847.GA9754@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Oct 20, 2014 at 11:18:02PM +0200, Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
>
> On Mon, 20 Oct 2014 17:59:05 -0300, Gustavo Zacarias wrote:
> > It's used by 50-default-udev.rules for input-class devices.
> >
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  package/eudev/eudev.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> I've seen the same issue a couple of days ago.
>
> Does systemd needs a similar fix?

Yes it does.

In my setup, I modified system/skeleton/etc/group to add "input:x:31:"

I'll send a patch similar to the eudev one.

Best regards
ELB
