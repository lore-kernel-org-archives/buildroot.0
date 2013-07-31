From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:08:00 +0200
Subject: [Buildroot] [PATCH] qt5jsbackend: needs ARM v5+
In-Reply-To: <1375288021-23307-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375288021-23307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130731190800.5f6a40aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 13:27:01 -0300, Gustavo Zacarias wrote:
> Just like nodejs and other v8-based javascript engines for ARM interwork
> it needs the BLX instruction which is only available on V5+ cores.
> Fixes:
> http://autobuild.buildroot.net/results/853/853cd29bf427902b2cb82a101964a4e45714cb86/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/qt5/qt5jsbackend/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
