From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Aug 2012 09:46:32 +0300
Subject: [Buildroot] [PATCH 6/8] fontconfig: add license info
In-Reply-To: <CANxTyt7w48eF1TBWJzbtaz_uao988-=y6W6LhTJF+CP9FUJNCg@mail.gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
 <1345407510-10058-6-git-send-email-danomimanchego123@gmail.com>
 <20120821125637.6b0257bc@skate>
 <CANxTyt7w48eF1TBWJzbtaz_uao988-=y6W6LhTJF+CP9FUJNCg@mail.gmail.com>
Message-ID: <20120822064631.GF3829@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Tue, Aug 21, 2012 at 08:39:26PM -0400, Danomi Manchego wrote:
> > For special licenses, I thought that the convention was to use the
> > string "foo license", and not just "foo".
> 
> Grepping, I see only three exceptions to this:
> 
> package/zxing/zxing.mk:ZXING_LICENSE = Apache
> package/poco/poco.mk:POCO_LICENSE = Boost-v1.0

Apache and Boost refer (also) to specific software licenses. See 
http://www.apache.org/licenses/ and http://www.boost.org/users/license.html. I 
think we should add a version number to Apache license info, though. In the 
case of zxing it's v2.0.

baruch

> package/openssl/openssl.mk:OPENSSL_LICENSE = OpenSSL or SSLeay
> 
> So, I'll resubmit as "fontconfig license".
> 
> What about sqlite?  According to http://www.sqlite.org/copyright.html, it
> is "public domain".  Should sqlite's license also be "sqlite license", or
> "public domain"?
> 
> Danomi -
> On Tue, Aug 21, 2012 at 6:56 AM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
> 
> > Le Sun, 19 Aug 2012 16:18:28 -0400,
> > Danomi Manchego <danomimanchego123@gmail.com> a ?crit :
> >
> > > +FONTCONFIG_LICENSE = fontconfig
> > > +FONTCONFIG_LICENSE_FILES = COPYING
> >
> > For special licenses, I thought that the convention was to use the
> > string "foo license", and not just "foo". Luca?
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
