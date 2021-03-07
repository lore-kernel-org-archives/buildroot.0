From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sun, 7 Mar 2021 22:08:20 +0100
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix checksum of
 license
In-Reply-To: <20210307205344.GC2275@scaer>
References: <86d5deb9-b0d8-b655-21b6-0f1f3a3f1f96@grenoble.cnrs.fr>
 <20210307204407.GZ2275@scaer> <20210307205344.GC2275@scaer>
Message-ID: <672c73c1-439b-fef6-d222-185ef20cf33b@grenoble.cnrs.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Yann E. MORIN wrote:
> Not a big deal, but in fact, the real commit that forgot to update the
> hash was commit f379e75dcd80 (boot/at91bootstrap3: bump to version
> 3.9.2), not ca1604388a86 as you mention.

Oops, sorry.

Well, actually both f379e75dcd80 and ca1604388a86 bumped the version of
at91bootstrap3, and both forgot to update the hash of main.c.

Regards,

Edgar Bonet.
