From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 12:12:48 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: selects openssl
In-Reply-To: <CAPi7W82tVic4+M663rJ8V-rTQh-=MhMPdgBgmWgr5nzcJvcO1g@mail.gmail.com>
References: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
 <20180604065939.326bf279@windsurf>
 <CAPi7W82tVic4+M663rJ8V-rTQh-=MhMPdgBgmWgr5nzcJvcO1g@mail.gmail.com>
Message-ID: <20180604121248.4eedd40c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jun 2018 07:25:05 +0200, Fabrice Fontaine wrote:

> > We've had php-amqp since October 2016 and the last version bump is from
> > May 2017, i.e a year ago. What has changed that makes php-amqp now
> > require OpenSSL support in rabbitmq-c ?
> >  
> SSL connection supports in php-amqp was added in 1.8.0beta2:
> https://github.com/pdezwart/php-amqp/commit/83defa18d958503a395e928d4669a23041014b2e
> .
> So it was introduced in buildroot by the bump to version 1.9.0 in May 2017.
> In autobuilders, we have three errors with php-amqp:
> http://autobuild.buildroot.net/?reason=php-amqp-1.9.0.
> The three errors are all related to SSL and the older one is from February
> 2018 but I suppose that autobuilder results are deleted after some time?

No, autobuilder results are never deleted.

Except in October 2017, when I had a hard disk crash, and we lost all
the autobuilder results that we had back then. But since October 2017,
all autobuilder results are there.

Strange that this problem did not occur more often. Only 3 times since
October 2017. But OK, it happened once in February 2018, once in May
2018 and more recently in June.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
