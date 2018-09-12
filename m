From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:06:28 +0200
Subject: [Buildroot] [PATCH 09/18] perl-class-load: new package
In-Reply-To: <20180820115519.24046-10-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-10-chrismcc@gmail.com>
Message-ID: <20180912230628.508a27d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:10 -0700, Christopher McCrory wrote:

> +PERL_CLASS_LOAD_DEPENDENCIES = perl-data-optlist perl-module-implementation perl-module-runtime perl-package-stash perl-try-tiny

This line was too long, so I split it with one package per line.

Applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
