From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 1 Jan 2014 06:41:26 +0200
Subject: [Buildroot] Packages that fail to be downloaded
In-Reply-To: <CAPFcPTJtoK3p0kseX-kQ7wNUyh5A+T7fwVETc89UcANmZZzJxw@mail.gmail.com>
References: <CAPFcPTJtoK3p0kseX-kQ7wNUyh5A+T7fwVETc89UcANmZZzJxw@mail.gmail.com>
Message-ID: <20140101044126.GF4263@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mau,

On Tue, Dec 31, 2013 at 11:58:25PM +0200, Mau Z wrote:
> The following package downloads fail:
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>> vim 699f8d8f096d Downloading
> Reason :   ERROR 404: Not Found.
> 
> >>> >>> python-nfc 142 Downloading
> Reason :   ERROR 404: Not Found.
> 
> >>> dvb-apps 83c746462ccb Downloading
> Reason :   ERROR 404: Not Found.

I had no problem downloading any of the above. Do you have Mercurial and Bzr 
installed on your system?

> >>> mxml 2.7 Downloading
> Reason :   Server does not answer......
> (http://ftp.easysw.com/pub/mxml/2.7/mxml-2.7.tar.gz)

This URL has changed in version 2013.08 (commit dc6d9070b). What version of 
Buildroot are you using?

> >>> xinetd 2.3.15 Downloading
> failed: Connection timed out.

www.xinetd.org is not responding here also. But automatic fall back to 
sources.buildroot.net works.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
