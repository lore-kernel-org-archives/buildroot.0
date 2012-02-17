From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Feb 2012 09:13:11 +0200
Subject: [Buildroot] cross compile when crosstool-ng selected
In-Reply-To: <CAPeX=+vkZe-E9_VVG_VGZw3dgcBBNNszC_UWyOU67YVHhSaj8A@mail.gmail.com>
References: <CAPeX=+vkZe-E9_VVG_VGZw3dgcBBNNszC_UWyOU67YVHhSaj8A@mail.gmail.com>
Message-ID: <20120217071310.GC3119@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ozgun,

On Fri, Feb 17, 2012 at 09:07:23AM +0200, Ozgun wrote:
> When crosstool-ng selected, the /output/toolchain folder isn't populated.
> Also toolchain can't be installed to target system (development environment
> and gcc options disappear from BR menuconfig)
> How can I compile my applications for target system?

Corsstool-NG does not support building a native toolchain (i.e. a toolchain 
you can run on your target). To compile applications for your target use the 
Crosstol-NG generated cross compiler.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
