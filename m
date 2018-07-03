From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 07:25:26 +0300
Subject: [Buildroot] [PATCH v2] dropbear: Disable legacy/insecure options
In-Reply-To: <20180507122844.30867-2-stefan.sorensen@spectralink.com>
References: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
 <20180507122844.30867-2-stefan.sorensen@spectralink.com>
Message-ID: <20180703042526.mzhwgl6eknqkumgr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Mon, May 07, 2018 at 02:28:44PM +0200, Stefan S?rensen wrote:
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
