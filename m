From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Feb 2012 11:34:24 +0200
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA29@MBXCLUSTER.mdh.local>
References: <CAGm1_ksrQ9Hp6LL4YiETokRf5gvJDpx3hmLqEUdSMg8eFE_xVA@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA24@MBXCLUSTER.mdh.local>
 <CAGm1_kuoq9uoEPVDUftFeUS9xfrtri_GTf-r9R0fuoZ1=woH3Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA25@MBXCLUSTER.mdh.local>
 <20120224154055.GB6613@game.jcrosoft.org>
 <63D6870D443E63419AC4A0C97B86C092030FCA26@MBXCLUSTER.mdh.local>
 <20120224163510.GC6613@game.jcrosoft.org>
 <63D6870D443E63419AC4A0C97B86C092030FCA28@MBXCLUSTER.mdh.local>
 <20120224213131.4fe770e2@skate>
 <63D6870D443E63419AC4A0C97B86C092030FCA29@MBXCLUSTER.mdh.local>
Message-ID: <20120226093424.GC3257@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikael,

On Sat, Feb 25, 2012 at 09:39:12AM +0100, Mikael ?sberg wrote:
> I understand that LZO has been mainlined in Linux.

ARM supports LZO kernel compression since version 2.6.33.

> How do I compress the kernel with LZO instead of the regular compression 
> algorithm (LZMA/BZIP2)?

Select "Kernel compression mode" under "General setup" in the kernel 
configuration.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
