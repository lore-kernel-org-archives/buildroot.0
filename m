From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Jan 2017 07:10:32 +0200
Subject: [Buildroot] [V2] python-mutagen: new package
In-Reply-To: <20170108050519.15969-1-Adamduskett@outlook.com>
References: <20170108050519.15969-1-Adamduskett@outlook.com>
Message-ID: <20170108051032.xatebuq5igsu4j76@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Sun, Jan 08, 2017 at 12:05:19AM -0500, Adam Duskett wrote:
> diff --git a/package/python-mutagen/Config.in 
> b/package/python-mutagen/Config.in
> new file mode 100644
> index 0000000..9d864ae
> --- /dev/null
> +++ b/package/python-mutagen/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_MUTAGEN
> +	bool "python-mutagen"
> +	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON_ZLIB

Is that a runtime dependency?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
