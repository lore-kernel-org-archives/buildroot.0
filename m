From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Jul 2017 21:43:42 +0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.12.0
In-Reply-To: <20170718235550.553abccb@windsurf>
References: <47939b206ec286f2ac9226b96a5b65fd2aa75991.1500377145.git.baruch@tkos.co.il>
 <20170718235550.553abccb@windsurf>
Message-ID: <20170719184342.xjgcj6dssd5zlksm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 18, 2017 at 11:55:50PM +0200, Thomas Petazzoni wrote:
> On Tue, 18 Jul 2017 14:25:45 +0300, Baruch Siach wrote:
> > Drop upstream patch.
> > 
> > Add uClibc-ng compatibility fix. This is needed due to missing definition in
> > netinet/in.h.
> > 
> > Correct the license. Source files license headers include the GPL "or ... any
> > later version" language.
> 
> If I'm not mistaken, this change in the license is not related to the
> 4.12.0 bump. I looked at the 4.11.0 version, and it already contains
> "or .. any later version".
> 
> So it seems like the license change should be in a separate patch,
> which should be backported to our LTS/maintenance branches.
> 
> Could you double check this and if you agree send separate patches?

The "any later version" language is there at least since the initial git 
import. I'll split this change out and repost.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
