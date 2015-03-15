From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Mar 2015 14:57:38 +0200
Subject: [Buildroot] [PATCH] bsdiff: Add hash file
In-Reply-To: <550580A2.3030608@dawncrow.de>
References: <550580A2.3030608@dawncrow.de>
Message-ID: <20150315125738.GB2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

On Sun, Mar 15, 2015 at 01:52:50PM +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/bsdiff/bsdiff.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/bsdiff/bsdiff.hash
> 
> diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
> new file mode 100644
> index 0000000..75846d3
> --- /dev/null
> +++ b/package/bsdiff/bsdiff.hash
> @@ -0,0 +1,2 @@
> +# From http://www.daemonology.net/bsdiff/:
> +sha256	e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz

Are you sure? This does not look like a valid SHA256 value. Should be MD5 
according to http://www.daemonology.net/bsdiff/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
