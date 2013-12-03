From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 10:01:21 +0100
Subject: [Buildroot] [PATCH] Rename netkitbase and netkittelnet
In-Reply-To: <CACjG4BK7us2HXea_yR4wHy=CHTB8uaUro9MKjXY_0dw7DkfMUQ@mail.gmail.com>
References: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
 <20131024153442.56a9157d@skate>
 <CACjG4BKEx1pGoWhDhYhV3ib+gz27rUZpMUwO8VhkOYh0+weROw@mail.gmail.com>
 <CACjG4BK7us2HXea_yR4wHy=CHTB8uaUro9MKjXY_0dw7DkfMUQ@mail.gmail.com>
Message-ID: <20131203100121.1c785df4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear arnaud aujon,

On Tue, 3 Dec 2013 09:47:08 +0100, arnaud aujon wrote:
> Hi,
> 
> 2013/10/24 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >
> >> Both of these packages have been marked deprecated since almost a year
> >> (November 2013). See 442765fe3d8767956eb26d4bcbaa62ce1e1782ca and
> >> 5a457ff6cc3129af97f2fdcaa5f88bd5ff02b500.
> >>
> >> So many it's simpler better to remove them completely?
> >
> >
> Now that 2013.11 is out, what about removing these packages ?
> Peter, what do you think ?

Both of these packages are marked as deprecated since 2012.11, so I
think we can safely remove them. In the Config.in.legacy entries that
will replace the two Config.in options of those packages, it would be
important to mention what are the replacement for those packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
