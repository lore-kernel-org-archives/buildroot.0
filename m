From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 5 Jun 2012 10:06:00 +0200
Subject: [Buildroot] adding a package
In-Reply-To: <20120605064159.GB18708@sapphire.tkos.co.il>
References: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
 <20120605055548.GA18708@sapphire.tkos.co.il>
 <CAGXs5wVOE2vH3wHcqS0Af2T0Oeg2GdNtktoK=o3Y3sGog9vSxQ@mail.gmail.com>
 <20120605064159.GB18708@sapphire.tkos.co.il>
Message-ID: <CAE4k238km9p1m-oYtN2BuOOkpT0sWoe210jB7N9khSMfYW-iaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 5, 2012 at 8:42 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Kevin,
>
> On Tue, Jun 05, 2012 at 09:28:55AM +0300, Kevin Wilson wrote:
>> Thanks for your quick response !
>> >If you need a package manager try
>> > something like yocto (http://www.yoctoproject.org).
>> >
>> I don't have experience with Yokto
>> Any idea: does Yokto has some known package manager mechansim (like
>> apt-get or rpm?) or is it uses some unique package manager of its own
>> ?
>
> I don't have experience with yocto either. A quick glance at
> http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html
> (especially the block diagram) seems to indicate that yocto support more than
> one package manager.

Yes, Yocto (or oe-core and meta-oe) supports opkg (ipk), deb, and rpm.
Likely opkg (ipk) and rpm are the most tested and most widely used.

/Anders
