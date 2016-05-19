From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 May 2016 21:39:31 +0300
Subject: [Buildroot] [PATCH] boot/uboot: fix missing host-openssl for
 i.MX28 target
In-Reply-To: <1463682441.2081.4.camel@embedded.rocks>
References: <1463659540-28813-1-git-send-email-joerg.krause@embedded.rocks>
 <20160519130203.GB2178@tarshish>
 <1463682441.2081.4.camel@embedded.rocks>
Message-ID: <20160519183931.GD2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, May 19, 2016 at 08:27:21PM +0200, J?rg Krause wrote:
> On Do, 2016-05-19 at 16:02 +0300, Baruch Siach wrote:
> > On Thu, May 19, 2016 at 02:05:40PM +0200, J?rg Krause wrote:
> > > From: J?rg Krause <jk@lintech.de>
> > 
> > I think you should keep Julien's authorship of this patch.
> 
> Yes! Honestly, I was suprised by this. In fact I didn't applied the
> patch with git, but by copy & paste and then did a git commit & git
> format-patch at work and git commit at home...

You can set the authorship of your latest commit with

  git --amend --author=[author]

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
