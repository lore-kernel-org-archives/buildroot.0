From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Feb 2018 19:17:12 +0200
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
Message-ID: <20180225171712.y2ww2nihnwum33te@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Feb 25, 2018 at 06:06:37PM +0100, Arnout Vandecappelle wrote:
> On 12-02-18 14:37, nimaim wrote:
> > This is semi unrelated, but along would this, would it make sense to bump the
> > current Qt LTS version from 5.6.x to 5.9.x (currently 5.9.4, which should
> > also be bumped from the 5.9.3 currently in the BR repo), and use this 5.10.x
> > version as BR2_PACKAGE_QT5_VERSION_LATEST as currently proposed?
> 
>  The problem is that 5.6.x is the last version that still was LGPL-2.0. For some
> companies this could be a problem.
> 
>  That said, I'm not particularly in favour of keeping old, unmaintained and
> probably vulnerable versions of packages just for companies' irrational fears of
> 3.0. It is clear from all the conditions we currently have that such maintenance
> does not come for free...

I would not call the fear of the anti-tivoization clause of LGPL3 irrational. 
It has real world impact on e.g. medical devices, where tivoization is 
sometimes a regulatory requirement.

>  So, any objections to replace Qt 5.6 with Qt 5.9?

That being said, I don't think we should keep Qt 5.6 forever. Anyone having 
problem with LGPL3 should either get a commercial license from the Qt Company, 
or look for alternatives.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
