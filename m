From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Dec 2013 13:56:14 +0200
Subject: [Buildroot] [PATCH 2/6] toolchain-external: add Sourcery MIPS
 2013.11, remove Sourcery MIPS 2012.03
In-Reply-To: <1388143942-1187-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131227115614.GA4197@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

A small nit.

On Fri, Dec 27, 2013 at 12:32:18PM +0100, Thomas Petazzoni wrote:
> This commit adds the support for the recently release Sourcery MIPS
> 2013.11 toolchain (gcc 4.8, gdb 7.6, glibc 2.18, gdb 7.6), and

You mention gdb twice. The same goes for the previous patch.

baruch

> consequently removes the support for the Sourcery MIPS 2012.03
> toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
