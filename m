From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 10 Mar 2012 21:26:17 +0200
Subject: [Buildroot] Changed package/Config.in; new packages not built
In-Reply-To: <CAL3m8eC=eztgUP8aw9+s9HL-9xe=o02sYHsVuDFqys=99PX_wQ@mail.gmail.com>
References: <CAL3m8eC=eztgUP8aw9+s9HL-9xe=o02sYHsVuDFqys=99PX_wQ@mail.gmail.com>
Message-ID: <20120310192616.GA3704@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Sat, Mar 10, 2012 at 09:24:57AM -0500, Matthew Farkas-Dyck wrote:
> I added packages to package/Config.in, and selected them, but the new
> packages are not built by make.
> 
> If I select packages that were in Config.in before, then they are built by 
> make.

Please send your changes here in a patch format.

> I can not find this at all in the documentation, nor in the mail list 
> archives.
> 
> How can I make make make these new packages?

See the "Adding new packages to Buildroot" section of the  documentation at 
http://buildroot.net/downloads/buildroot.html#add_packages.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
