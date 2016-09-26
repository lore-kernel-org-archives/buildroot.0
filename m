From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2016 09:33:44 +0300
Subject: [Buildroot] [PATCH] pahomqtt-c: new package
In-Reply-To: <1474871431-19111-1-git-send-email-Pranit.Sirsat@imgtec.com>
References: <1474871431-19111-1-git-send-email-Pranit.Sirsat@imgtec.com>
Message-ID: <20160926063344.gb43kh2qbg6vsew6@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pranit Tanaji Sirsat,

On Mon, Sep 26, 2016 at 12:00:31PM +0530, Pranit Tanaji Sirsat wrote:
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 84e00c8..19a4270 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1148,6 +1148,9 @@ N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>  F:	package/libdvbpsi/
>  F:	package/mraa/
>  
> +N:	Pranit Sirsat <Pranit.Sirsat@imgtec.com>
> +F:	package/pahomqtt-c/

Please split the DEVELOPERS update to a separate patch. This makes later 
cherry-picking easier.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
