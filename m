From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jun 2016 16:10:20 +0300
Subject: [Buildroot] Help in enabling large file support
In-Reply-To: <OF4EEEEFB0.32E05D87-ONC1257FDF.004683FE-C1257FDF.0046C4AF@eu.omron.com>
References: <OFEC3F3C04.179E3A42-ONC1257FDF.00434B2F-C1257FDF.00437E69@eu.omron.com>
 <20160627123212.GS2319@tarshish>
 <OF4EEEEFB0.32E05D87-ONC1257FDF.004683FE-C1257FDF.0046C4AF@eu.omron.com>
Message-ID: <20160627131020.GT2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Davit,

On Mon, Jun 27, 2016 at 02:52:55PM +0200, Davit Mirzoyan wrote:
> Thank you for your reply. I see. Is it normal then that I do not find "
> BR2_LARGEFILE " variable defined anywhere. 
> 
> I am adding a package that requires largefile support and I add a line in 
> the config file of the package as shown below
> 
> comment "partclone requires a toolchain with LARGEFILE+WCHAR support"
> 
>         depends on !(BR2_LARGEFILE && BR2_USE_WCHAR) 
> 
> Shall I just remove the BR2_LARGEFILE variable?

Yes.

Also please spell wchar in lowercase, and drop the word 'support'. That's the 
current convention.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
