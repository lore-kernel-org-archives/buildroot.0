From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:47:39 +0200
Subject: [Buildroot] [PATCH v4 1/4]
 package/gstreamer1/gst1-plugins-good: convert package type to meson
In-Reply-To: <20190713214321.119654-1-aduskett@gmail.com>
References: <20190713214321.119654-1-aduskett@gmail.com>
Message-ID: <f0e96d45-f42c-b9fb-5126-690dcfa5eea1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/07/2019 23:43, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
>     Existing configs will already have BR2_PACKAGE_ZLIB selected, so no legacy
>     entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 I finally applied this series to master, thanks.

 Let's see what the autobuilders have to say... It would be a surprise if a big
change like this would not introduce any errors.

 Regards,
 Arnout
