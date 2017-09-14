From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Sep 2017 18:21:51 +0300
Subject: [Buildroot] [PATCH] CHANGES: update after netsnmp changes
In-Reply-To: <20170914125316.1872-1-julien.floret@6wind.com>
References: <20170914125316.1872-1-julien.floret@6wind.com>
Message-ID: <20170914152151.qfxut4v3w4q7mwvt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Sep 14, 2017 at 02:53:16PM +0200, Julien Floret wrote:
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  CHANGES | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/CHANGES b/CHANGES
> index c042bf5e3e6e..89d9e2a5fa95 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,9 @@
> +2017.11-rc1, To be released
> +
> +	netsnmp: all MIB files are now installed, making the target filesystem a
> +	bit bigger than before. To remove unneeded MIBS, you should use a
> +	post-build script.
> +
>  2017.08, Released September 1st, 2017
>  
>  	Minor fixes.

This sort of documentation should go to the "Migrating from older Buildroot 
versions" section in the manual at docs/manual/migrating.txt.

Usually only the maintainers update the CHANGES file.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
