From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jun 2016 15:32:12 +0300
Subject: [Buildroot] Help in enabling large file support
In-Reply-To: <OFEC3F3C04.179E3A42-ONC1257FDF.00434B2F-C1257FDF.00437E69@eu.omron.com>
References: <OFEC3F3C04.179E3A42-ONC1257FDF.00434B2F-C1257FDF.00437E69@eu.omron.com>
Message-ID: <20160627123212.GS2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Davit,

On Mon, Jun 27, 2016 at 02:17:10PM +0200, Davit Mirzoyan wrote:
> Could you please help me enable large file support in buildroot?

Buildroot removed support for non-largefile toolchain build since version 
2015.05. There is no need to explicitly enable largefile now, it's always 
enabled.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
