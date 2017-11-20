From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Nov 2017 16:54:19 +0200
Subject: [Buildroot] [NEXT 1/1] bash: bump to 4.4.12
In-Reply-To: <20171120140546.23268-1-aduskett@gmail.com>
References: <20171120140546.23268-1-aduskett@gmail.com>
Message-ID: <20171120145419.pxjyln3kj4idd6sg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Mon, Nov 20, 2017 at 09:05:46AM -0500, Adam Duskett wrote:
> In addition, remove upstreamed patches and add a hash for the license file.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

[...]

> diff --git a/package/bash/bash.hash b/package/bash/bash.hash
> index adbd608..3a0ed7e 100644
> --- a/package/bash/bash.hash
> +++ b/package/bash/bash.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated after checking pgp signature

Having a link to the signature here would be nice.

  http://ftp.gnu.org/gnu/bash/bash-4.4.12.tar.gz.sig

> -sha256 d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb  bash-4.4.tar.gz
> +sha256 57d8432be54541531a496fd4904fdc08c12542f43605a9202594fa5d5f9f2331	bash-4.4.12.tar.gz
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
