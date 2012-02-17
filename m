From: Ozgun <ozgun.gunay@gmail.com>
Date: Fri, 17 Feb 2012 11:06:11 +0200
Subject: [Buildroot] cross compile when crosstool-ng selected
In-Reply-To: <20120217071310.GC3119@tarshish>
References: <CAPeX=+vkZe-E9_VVG_VGZw3dgcBBNNszC_UWyOU67YVHhSaj8A@mail.gmail.com>
 <20120217071310.GC3119@tarshish>
Message-ID: <CAPeX=+tg50C7qu67exCpn+S0zXGnY=5BQTb4QbSc5S0xHga4bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I guess Crosstol-NG generated cross compiler is located under
/output/host/usr
I want to compile and install the
qtquick3d-tp2-src.tar.gz<ftp://ftp.qt.nokia.com/qt3d/noarch/current/qtquick3d-tp2-src.tar.gz>to
the target.
How can I do this?

thanks,




On Fri, Feb 17, 2012 at 9:13 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Ozgun,
>
> On Fri, Feb 17, 2012 at 09:07:23AM +0200, Ozgun wrote:
> > When crosstool-ng selected, the /output/toolchain folder isn't populated.
> > Also toolchain can't be installed to target system (development
> environment
> > and gcc options disappear from BR menuconfig)
> > How can I compile my applications for target system?
>
> Corsstool-NG does not support building a native toolchain (i.e. a toolchain
> you can run on your target). To compile applications for your target use
> the
> Crosstol-NG generated cross compiler.
>
> baruch
>
> --
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120217/ed091050/attachment.html>
