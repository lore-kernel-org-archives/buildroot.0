From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2013 08:24:21 +0200
Subject: [Buildroot] need a small MUA
In-Reply-To: <1363388011.8204.393.camel@genx.eng.msli.com>
References: <1363388011.8204.393.camel@genx.eng.msli.com>
Message-ID: <20130317062421.GD5654@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On Fri, Mar 15, 2013 at 03:53:31PM -0700, John Stile wrote:
> My project is still on buildroot-2011.11
> I need to make a very simple email program.
> Are my options just poco or libcurl, or are there packages I should
> consider?

If by MUA you mean Mail User Agent, then I'm not sure how poco or libcurl 
would help you to read your email box. In a quick glance at the list of 
Buildroot packages present in 2011.11 I've found mutt which might give you 
what you want. heirloom-mailx appeared in 2012.05, and should be easy to 
backport.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
