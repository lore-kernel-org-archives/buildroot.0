From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Aug 2014 06:21:07 +0200
Subject: [Buildroot] [PATCH v16 0/3] package/xbmc: Add support for
	OpenGL and libva, add option for Goom
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <20140812230542.GF4055@free.fr>
Message-ID: <XnsA388409D845B1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140812230542.GF4055 at free.fr:

> I've lost track of all your XBMC-related series. Is the v16 the last
> one? Do we miss anything in Buildroot for XBMC ?

no, currently there are no pending patches to extend the functionality of the 
xbmc package. I will post a version bump to 13.2rc1 soon, however. For my 
personal needs I would like to see your libudev patch series in buildroot ;)

> I guess we'll need more stuff for Kodi, but that can come later.

Locally I already renamed xbmc to Kodi and bumped the package to 14.0alpha2. 
Buildroot 2014.08 will most likely contain Gotham, however. When Helix/Kodi 
reaches beta stage I will post another version bump. This bump will then 
consist of three patches:

- move package/xbmc/* to package/kodi/* and rename files
- rename variables XBMC_* to KODI_* and add legacy options
- bump to 14.0...

Did I miss something?

Regards, Bernd
