From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 14:43:52 +0200
Subject: [Buildroot] [PATCH v4 05/19] package/linphone: add support for
 ffmpeg 3.0
In-Reply-To: <1459194585-12593-6-git-send-email-bernd.kuhls@t-online.de>
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <1459194585-12593-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329144352.296deb3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 21:49:31 +0200, Bernd Kuhls wrote:
> Linphone 3.6 is incompatible with bumped mediastreamer and ortp
> packages. Like Debian we use the bundled versions instead and add the
> Debian patch series to support ffmpeg 3.0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is causing a number of build failures:

  http://autobuild.buildroot.org/?reason=linphone-3.6.1

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
