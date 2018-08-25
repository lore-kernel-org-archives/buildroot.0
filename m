From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Aug 2018 00:01:38 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
In-Reply-To: <2pv85fxpst.ln2@ID-313208.user.individual.net>
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
 <o5u85fxpst.ln2@ID-313208.user.individual.net>
 <20180825233958.29369922@windsurf>
 <2pv85fxpst.ln2@ID-313208.user.individual.net>
Message-ID: <20180826000138.1a2d8328@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 23:54:10 +0200, Bernd Kuhls wrote:

> ok, will also do that. Where can I get such a toolchain? Could you please 
> point me to a defconfig?

I don't have anything like that readily available, unfortunately. You'd
have to pick a Buildroot version that is old enough to still support
gcc 4.7, or see if Crosstool-NG can help here.

Unfortunately, due to the autobuild.b.o server crash in October 2017, I
lost all pre-built toolchains I had built before that :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
