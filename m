From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Nov 2017 07:11:47 +0200
Subject: [Buildroot] [PATCH 1/2] openntpd: update to 6.2p3
In-Reply-To: <CAFSsvmqDFVSSwmT0FaUqQmZh3xR92pSxmdV_V2PQ2H_EFEF1Pg@mail.gmail.com>
References: <20171108130459.25412-1-aduskett@gmail.com>
 <20171108133119.5f3vd7d2owvvtevc@tarshish>
 <CAFSsvmqDFVSSwmT0FaUqQmZh3xR92pSxmdV_V2PQ2H_EFEF1Pg@mail.gmail.com>
Message-ID: <20171120051147.qoedwxoxivo3encc@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Sun, Nov 19, 2017 at 04:50:47PM -0500, Adam Duskett wrote:
> On Wed, Nov 8, 2017 at 8:31 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Nov 08, 2017 at 08:04:58AM -0500, Adam Duskett wrote:
> >> Other changes:
> >>   - Remove upstream patch.
> >
> > I think you can drop the AUTORECONF as well.
>
> Still broken :\

What is broken?

I case AUTORECONF is still necessary even after the Makefile.am patch removal, 
the comment needs update.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
