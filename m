From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Sep 2017 10:01:24 +0300
Subject: [Buildroot] [PATCH] libmbim: add udev as optional feature
In-Reply-To: <CAAP7ucKx_1yLVfsu-tN6exoYXh6ZJHpgS26_TJs4mUz41NL2JA@mail.gmail.com>
References: <20170906212809.18889-1-aleksander@aleksander.es>
 <20170906234741.63deeb81@windsurf.lan>
 <CAAP7ucKx_1yLVfsu-tN6exoYXh6ZJHpgS26_TJs4mUz41NL2JA@mail.gmail.com>
Message-ID: <20170907070124.wnmcdby4xnmejuck@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aleksander,

On Thu, Sep 07, 2017 at 08:05:32AM +0200, Aleksander Morgado wrote:
> > On Wed,  6 Sep 2017 23:28:09 +0200, Aleksander Morgado wrote:
> >> udev support will be enabled in the build if libgudev is selected.
> >>
> >> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> >
> > Applied to master, thanks! I just realized you're the maintainer for
> > libmbim and libqmi, so it's nice to see you sending patches to
> > Buildroot to improve their packaging!
> 
> Speaking of which, is there any way I can get CC-ed to changes done in
> either libqmi, libmbim or modem-manager? I wouldn't mind to review
> those.

Add an entry to DEVELOPERS listing the packages you are interested in.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
