From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 11:31:12 +0100
Subject: [Buildroot] [PATCH v2 00/12] Introducing XBMC
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <oktpqaxbuu.ln2@ID-313208.user.individual.net>
Message-ID: <go1qqaxahj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:oktpqaxbuu.ln2 at ID-313208.user.individual.net: 

> Right now I stumbled across fribidi, which is a required dependency for 
> gotham, it also needs to be included in libass, this patch for libass.mk
> is enough: 
> 
> -LIBASS_DEPENDENCIES = freetype fontconfig libenca
> +LIBASS_DEPENDENCIES = freetype fontconfig libenca fribidi

Hi,

oops, just found out, that libfridi was added to buildroot 2013-01-05, so its 
just 

-LIBASS_DEPENDENCIES = freetype fontconfig libenca
+LIBASS_DEPENDENCIES = freetype fontconfig libenca libfribidi

Regards, Bernd
