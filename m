From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Jun 2008 10:45:20 +0200
Subject: [Buildroot] A question about procedure (ARM related)
References: <1213230024.6098.8.camel@kokopelli>
Message-ID: <026b01c8cc7f$d6790f30$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think it is better to have it in a separate directory.
target/device/KwikByte.
This way, we can play around with the target/device/Atmel
without affecting other boards too much.

Best Regards
Ulf Samuelsson 


> Ulf,
> I have added support for an at91rm9200 based board (kb9202 from
> KwikByte), to buildroot in the target/device/Atmel directory.  I would
> post a patch or even be willing to add it directly if given svn write
> access.
> 
> The reason I have not posted the patch is I'm not sure if the Atmel
> directory is the right place.
> 
> -- 
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting a bad thing?
> 
> Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
> beattie at beattie-home.net | It's about dealing with the consequences."
> www.beattie-home.net     | -- Midori Koto
> 
>
