From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Nov 2017 18:00:48 +0100
Subject: [Buildroot] [NEXT v2 2/7] libpjsip: enable alsa support
In-Reply-To: <20171114160712.20086-2-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
 <20171114160712.20086-2-aduskett@gmail.com>
Message-ID: <20171114180048.7933434f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 11:07:07 -0500, Adam Duskett wrote:
> If alsa-lib is selected, libpjsip should depend on it.
> Also, remove --disable-sound in the configure options or else sound would
> still be disabled.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Remove the option to enable or disable alsa support in favor of
>     just depending on alsa-lib if it's selected by the user.

Why? This seems completely backward with the typical Buildroot
practices.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
