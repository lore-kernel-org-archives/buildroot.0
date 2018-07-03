From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 13:38:26 +0300
Subject: [Buildroot] [PATCH v3] dropbear: Disable legacy/insecure options
In-Reply-To: <20180703074810.19105-1-stefan.sorensen@spectralink.com>
References: <20180703074810.19105-1-stefan.sorensen@spectralink.com>
Message-ID: <20180703103826.yk7jzpvg7xfhagr4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Tue, Jul 03, 2018 at 09:48:10AM +0200, Stefan S?rensen wrote:
> Dropbear by default enables a number of algorithms that are now considered
> insecure and should only be used when legacy support is required:
>    3DES encryption
>    Blowfish encryption
>    SHA1-96 message integrity
>    CBC encryption mode
>    DSA public keys
>    Diffie-Hellman Group1 key exchange
> 
> So disable them by default, but add a config option for bringing them back.
> Furthermore the Blowfish legacy algorithm is unconditionally disabled
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
