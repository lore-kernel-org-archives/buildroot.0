From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Nov 2014 07:40:42 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
In-Reply-To: <20141122171615.7eb18494@free-electrons.com>
References: <1416587791-30125-1-git-send-email-jaap@jcz.nl>
 <546F6FCB.1090101@imgtec.com>
 <20141122171615.7eb18494@free-electrons.com>
Message-ID: <20141123054042.GF2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Vicente,

On Sat, Nov 22, 2014 at 05:16:15PM +0100, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 21 Nov 2014 17:00:59 +0000, Vicente Olivert Riera wrote:
> 
> > Another one. When you create the patch using "git format-patch", before
> > sending it, please edit the patch using your favourite text editor and
> > add the version number in the "Subject" line. Here is an example using
> > your own patch:
> > 
> > Subject: [PATCH v2] bluez5_utils: bumped version number to 5.25
> 
> Just a quick comment: there's no need to fire up a text editor to do
> this. Just do:
> 
> 	git format-patch --subject-prefix="PATCHv2"

Since you mentioned it I'll add that with a recent enough version of git you 
can shorten it to

	git format-patch -v 2

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
