From: Jonas Keidel <jonas@jonas-keidel.de>
Date: Sat, 30 Jun 2012 15:12:27 +0200
Subject: [Buildroot] Buildroot Udev Compiling
In-Reply-To: <4FEEF971.2000802@mind.be>
References: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
 <4FEEF971.2000802@mind.be>
Message-ID: <006601cd56c2$0004c850$000e58f0$@jonas-keidel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  I can't find the root cause of the problem (in fact, in my case it
already fails when compiling attr), but my guess is that
BR2_PREFER_STATIC_LIB is causing trouble.  Do you really need it?

Yes I really need it, because i build an special initramfs booting script
and for that I need udev static build.
But maybe it is possible to use it in another way. How can I do it? How can
I implement udev in my busybox environment?

Thx for answer.
