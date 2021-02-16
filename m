From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:51:28 +0100
Subject: [Buildroot] [PATCH v2,3/3] package/perl-gd: provide gd options
In-Reply-To: <20210212063944.2202888-3-fontaine.fabrice@gmail.com>
References: <20210212063944.2202888-1-fontaine.fabrice@gmail.com>
 <20210212063944.2202888-3-fontaine.fabrice@gmail.com>
Message-ID: <de3fad50-3290-8826-031f-90ec3cdc8791@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 07:39, Fabrice Fontaine wrote:
> Now that gdlib-config is gone, provide the GD options otherwise perl-gd
> will assume that everything is available:
> 
> $features = 'GD_GIF GD_GIFANIM GD_OPENPOLYGON GD_ZLIB GD_PNG GD_FREETYPE GD_FONTCONFIG GD_JPEG GD_XPM GD_TIFF GD_WEBP';
> 
> Also, while at it, also make some of the dependencies as optional as
> suggested by Fran?ois Perrad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


 Applied to master, thanks.

 Regards,
 Arnout

[snip]
