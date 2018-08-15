From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 13:56:47 +0200
Subject: [Buildroot] [PATCH 6/8] package/mender: populate the
 mender.conf template
In-Reply-To: <20180814231337.19114-7-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-7-mirza.krak@northern.tech>
Message-ID: <20180815135647.2ed1e874@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 01:13:35 +0200, Mirza Krak wrote:
> Options are provided for the Mender configuration and the
> default values should work together with a Mender demo
> environment.
> 
> https://docs.mender.io//getting-started/create-a-test-environment
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

I'm sorry, but no. We are not going to add gazillions of options to
each and every package to be able to configure the zillions of possible
knobs that can be configured. We are not going to add options to create
virtual hosts in Apache or Lighttpd, we are not going to add options to
enable/disable each and every cipher in OpenSSH, etc.

The point of Buildroot is to provide a reasonable default mender.conf,
and let user override it with their own configuration file as part of a
root filesystem overlay.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
