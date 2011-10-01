From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Oct 2011 22:11:10 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <20110930195805.0677ff0b@skate>
References: <4E79E001.7010409@lucaceresoli.net>
 <CAAXf6LUvj5gJxmLa1gL1WssYJUs9fvWa30cAEBFpscQF_QXMoA@mail.gmail.com>
 <20110930195805.0677ff0b@skate>
Message-ID: <201110012211.12448.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 30 September 2011 19:58:05, Thomas Petazzoni wrote:
> > > All these Config.in.host
> > >   files are included in a single "Packages -> Host utitities"
> > > submenu, from package/Config.in. There is no need to create
> > > subsections in this menu at the moment, since the number of
> > > utilities shown here is suspected to remain limited.
> >
> > 
> >
> > If you want to add the new menu under Packages, then the description
> > of that menu should change. Currently it is:
> > "Package Selection for the target"
> > A proposal is simply:
> > "Package selection"
> >
> > 
> >
> > The alternative is as proposed earlier: to put the menu at top-level.
> 
> No strong opinion here. Perhaps a new top-level menu is better, I don't
> know.

 I also prefer a new top-level menu.

 However, what do we do with the bootloader installers (i.e. host-grub and 
friends)?  It would feel a little strange to move them out of the bootloader 
menu...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111001/77812ddc/attachment.html>
