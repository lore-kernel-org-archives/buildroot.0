From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Aug 2015 19:23:47 +0300
Subject: [Buildroot] Java 7 (IcedTea / OpenJDK / JamVM)
In-Reply-To: <CAJtjsKZkwagH=wOECedbiEUndwdjTVXR2X+MChhxSYdnywAgsw@mail.gmail.com>
References: <CAJtjsKZkwagH=wOECedbiEUndwdjTVXR2X+MChhxSYdnywAgsw@mail.gmail.com>
Message-ID: <20150825162346.GY2619@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Tue, Aug 25, 2015 at 05:31:42PM +0200, Johan Oudinet wrote:
> There is an option to disable the download of archives but you have to
> provide the location to them. I wonder how I should download such
> extra tarballs in Buildroot?
> I think making an extra package for each of them is overkill as I
> don't need to extract them, the icedtea makefile does it by itself.
> Should I use a (pre/post) download hook to download these archives or
> is there a better way to proceed?

Try <PKG>_EXTRA_DOWNLOADS. The only current user of this capability is 
package/perl/perl.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
