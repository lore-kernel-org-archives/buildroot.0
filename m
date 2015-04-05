From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 5 Apr 2015 22:35:31 +0300
Subject: [Buildroot] [PATCH 1/1] i2c-tools: add support to build python
 extension
In-Reply-To: <CALq67GDTrohkUMGPYNv+iWvgZKXAfyJ9ADpc9G5RvPPMpUOmRw@mail.gmail.com>
References: <1428259675-7116-1-git-send-email-ryanbarnett3@gmail.com>
 <20150405191324.GB2183@tarshish>
 <CALq67GDTrohkUMGPYNv+iWvgZKXAfyJ9ADpc9G5RvPPMpUOmRw@mail.gmail.com>
Message-ID: <20150405193531.GC2183@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Sun, Apr 05, 2015 at 02:22:15PM -0500, Ryan Barnett wrote:
> On Sun, Apr 5, 2015 at 2:13 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Sun, Apr 05, 2015 at 01:47:55PM -0500, Ryan Barnett wrote:
> >> +config BR2_PACKAGE_I2C_TOOLS_PYSMBUS
> >
> > I don't think another config option is necessary. The size of i2c-tools python
> > binding is negligible when compared to the size of python itself.
> 
> Good point. So do I still keep a comment there about py-smbus not
> being enabled unless python is selected? Otherwise someone might not
> know that i2c-tools has the python bindings which is why I had the
> config option to begin with.

I think it is reasonable to expect users looking for a python binding to 
enable python itself first.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
