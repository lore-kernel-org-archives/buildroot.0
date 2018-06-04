From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 06:59:39 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: selects openssl
In-Reply-To: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
References: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
Message-ID: <20180604065939.326bf279@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 21:31:26 +0200, Fabrice Fontaine wrote:
> php-amqp needs a rabbitmq-c with openssl support:
> https://github.com/pdezwart/php-amqp/issues/310

We've had php-amqp since October 2016 and the last version bump is from
May 2017, i.e a year ago. What has changed that makes php-amqp now
require OpenSSL support in rabbitmq-c ?

Is this an issue that was always occurring, but we never fixed ? Is it
a new issue ? If so, why does it suddenly started to happen ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
