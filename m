From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 30 Aug 2011 15:39:41 +0200
Subject: [Buildroot] [PATCH] New package: bluez-utils
In-Reply-To: <20110829143314.517ae5ad@skate>
References: <4E54B7CB.500@visionsystems.de> <20110829143314.517ae5ad@skate>
Message-ID: <4E5CE81D.7000809@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 29.08.2011 14:33, schrieb Thomas Petazzoni:
> Le Wed, 24 Aug 2011 10:35:23 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> +BLUEZ_UTILS_CONF_OPT = --enable-hidd --enable-test --enable-alsa
> If it uses alsa, then maybe some dependency on alsa-lib is needed, no?
>
> Thomas

You're right. I've added this and other dependencies.

Though I specify --enable-test, I still don't know and how it will be installed. Any idea?

Yegor
