From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:38:35 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/opencv3: bump to
 version 4.2.0"
In-Reply-To: <CAPi7W83sKWaXCqbvy=efwP0kBGOaDXc4M-kxpQGQOqPshf1UYA@mail.gmail.com>
References: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
 <CADvTj4oMaxJAUiUQJ8Ze22mrKytQZXbNWg4ysgf2TNMhcnButw@mail.gmail.com>
 <CAPi7W83sKWaXCqbvy=efwP0kBGOaDXc4M-kxpQGQOqPshf1UYA@mail.gmail.com>
Message-ID: <20200330083835.2a4d8967@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Mar 2020 08:41:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > This reverts commit 5e51bb2756ee5063eff9a45a46033a449e2a6195.
> > > Indeed, version 4.x is not backward with opencv 3.x, most of the C API
> > > has been removed as stated in https://opencv.org/opencv-4-0.  
> > I guess we need a separate opencv4 package then for this?  
> Yes, I think this is the best course of action.

What is the plan then with package/opencv ? Indeed, adding
package/opencv4 would mean having 3 different versions of OpenCV
supported. Does that make sense? Should we drop support for OpenCV 2.x ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
