From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Jul 2017 19:10:54 +0300
Subject: [Buildroot] [PATCH 2/3] efivar: bump to version 31
In-Reply-To: <20170711155957.10815-2-thomas.petazzoni@free-electrons.com>
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
 <20170711155957.10815-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20170711161054.qhsr2glldmil6uzt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 11, 2017 at 05:59:56PM +0200, Thomas Petazzoni wrote:
> This allows to drop two patches that have been upstreamed:
> 
>  0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch is
>  upstream as of commit 18b9b3dd7ebf23a16de07b3fb6ae622be488d712
> 
>  0003-Remove-some-extra-const-that-gcc-complains-about.patch is
>  upstream as of commit 1c7c0f71c9d22efda4156881eb187b8c69d1cca7.

Version 31 is marked as pre-release[1], like 29 and 25 before. It seems like 
only even version numbers are stable releases.

[1] https://github.com/rhboot/efivar/releases

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
