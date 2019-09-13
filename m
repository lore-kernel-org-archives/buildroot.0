From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 Sep 2019 15:12:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: new package.
In-Reply-To: <20190913140448.2a651ba3@thl530.multi.box>
References: <20190913112413.31969-1-raphael.melotte@essensium.com>
 <20190913140448.2a651ba3@thl530.multi.box>
Message-ID: <87sgp0s8dj.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 13 2019, Thomas Huth wrote:
>> +JBIG2DEC_VERSION = 0.16
>> +JBIG2DEC_SITE =
>> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927
>
> For packages located on github, you better use the github helper
> function, see:
>
>  https://buildroot.org/downloads/manual/manual.html#github-download-url

This is true only when upstream does not provide an official
tarball. See the first sentence in the paragraph that this URL refers
to:

  Packages on GitHub often don?t have a download area with release tarballs.

Tarballs are preferred when available.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
