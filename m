From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Nov 2016 11:17:04 +0200
Subject: [Buildroot] [PATCH] odroid-scripts: add support for auto resize
 on first boot for SYSV
In-Reply-To: <trinity-98d65c2c-3870-44c4-bb2a-2a6c5d8ab78a-1480496386225@3capp-mailcom-bs02>
References: <20161127212449.14159-1-daggs@gmx.com>
 <20161127222742.5a58f49c@free-electrons.com>
 <trinity-2fcdc0f4-9fb1-4f65-8c09-14877a9c5f63-1480282606427@3capp-mailcom-bs07>
 <20161127225136.37b20b37@free-electrons.com>
 <trinity-98d65c2c-3870-44c4-bb2a-2a6c5d8ab78a-1480496386225@3capp-mailcom-bs02>
Message-ID: <20161130091704.eerbj7gwpslfoynp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dagg,

On Wed, Nov 30, 2016 at 09:59:46AM +0100, daggs wrote:
> > Well, we certainly don't want to have it unconditionally installed, so
> > it would have to be optional. And a package is nice to isolate this
> > feature and the related init script in a clean way.
> 
> two questions:
> 1. how to define a pkg that has no download url?

See the makedevs package as an example.

> 2. pkg name?

part-resize-full maybe?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
