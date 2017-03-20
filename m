From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 22:39:10 +0200
Subject: [Buildroot] [PATCH 1/2] keepalived: fix libnl optional
	dependnecy
In-Reply-To: <20170320211558.432299e0@free-electrons.com>
References: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
 <20170320211558.432299e0@free-electrons.com>
Message-ID: <20170320203910.c3f5ryylyrscymot@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 20, 2017 at 09:15:58PM +0100, Thomas Petazzoni wrote:
> On Mon, 20 Mar 2017 21:57:25 +0200, Baruch Siach wrote:
> 
> > +	select BR2_PACKAGE_LIBNFNETLINK if BR2_PACKAGE_LIBNL
> 
> We generally don't do this, and only do the "double" condition that you
> have below.

OK. I'll drop this select.

> But if you prefer this "select", then the double condition is no longer
> needed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
