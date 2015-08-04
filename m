From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Aug 2015 23:40:11 +0300
Subject: [Buildroot] [PATCH 1/1] rapidxml: new package
In-Reply-To: <alpine.DEB.2.02.1508041932350.7707@orcam81.orcam.lan>
References: <1438625054-7118-1-git-send-email-yba@tkos.co.il>
 <20150803195742.GJ3345@tarshish>
 <alpine.DEB.2.02.1508041932350.7707@orcam81.orcam.lan>
Message-ID: <20150804204011.GM3345@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Tue, Aug 04, 2015 at 07:37:14PM +0300, Jonathan Ben Avraham wrote:
> >On Mon, Aug 03, 2015 at 09:04:14PM +0300, Jonathan Ben-Avraham wrote:
> >>+RAPIDXML_INSTALL_TARGET = NO
> >
> >This needs an explanation comment. Is this a header only package?
> >
> >>+RAPIDXML_INSTALL_STAGING = YES

[snip]

> Regarding "This needs an explanation comment. Is this a header only
> package?", you can see from RAPIDXML_INSTALL_TARGET = NO and
> RAPIDXML_INSTALL_STAGING = YES that the answer must be "yes". I did not see
> a need to add a comment since the precedent package "rapidjson", also has no
> comment.

Set precedents are not always a good guide. That's the case here, IMO.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
