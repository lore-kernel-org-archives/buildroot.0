From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 13 Oct 2008 10:40:48 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
In-Reply-To: <48F3016E.9080308@control.lth.se>
References: <48F1CE78.3040908@control.lth.se>
	<20081013081228.14f1e6c7@hcegtvedt>
	<48F2EF1B.70102@control.lth.se> <20081013073057.GA9429@mx.loc>
	<48F3016E.9080308@control.lth.se>
Message-ID: <20081013084048.GB9429@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 13, 2008 at 10:06:06AM +0200, Anders Blomdell wrote:

>> Did you read docs/README and try what's documented there (see
>> "finegrained")?
>No, missed that (or more correctly I interpreted that setting
>BR2_PACKAGE_BUSYBOX_CONFIG should be equivalent).

It's supposed to override any config- or board-imposed configfile(s). If
it's broken in svn then bug somebody to fix it.

cheers,
