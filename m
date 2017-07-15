From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 12:09:54 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2017-06-30
In-Reply-To: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
References: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20170715120954.68067f9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 19:53:21 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This package is causing a large number of timeouts, apparently due to
the fetch of submodules failing. It only happens on my autobuilder
instance it seems:

  http://autobuild.buildroot.net/?reason=azure-iot-sdk-c-2017-06-30

Is there something that can be done about this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
