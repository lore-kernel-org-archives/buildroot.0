From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:52:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exiv2: fix thread detection
 with xmp support disabled
In-Reply-To: <20170603170842.12946-1-bernd.kuhls@t-online.de>
References: <20170603170842.12946-1-bernd.kuhls@t-online.de>
Message-ID: <20170604095255.0c8fc3d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 19:08:42 +0200, Bernd Kuhls wrote:
> Exiv2 itself depends on threads, not only with xmp support.
> 
> Fixes
> http://autobuild.buildroot.net/results/46f/46f273cf46ab5050ce7c23c968fcc7ce69f32626/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed thread dependency (Romain)

I have already applied your v1 of this patch, so could you send a
follow-up patch instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
