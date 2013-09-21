From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 05:37:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-19
In-Reply-To: <20130920063008.7C55952C101@lolut.humanoidz.org>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
Message-ID: <20130921053754.4d269f1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Sep 2013 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

>        arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/14eeec85eb97fa4dc27425eb13198b1ffd6cf450/
>        arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2b452476b75cdda4bfce57b1d93fefd71301d41b/
>        arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/3610be3ef00226a6fd4fd1235e7b247288c7e57f/
>       i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e5c4f5e25c72430e5160308b4db7210e7877666e/
>     x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/063915a55e49096a39a53f8839953f5efaec261e/
>     x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b4710a36679b516c07b37e73a815857764cab449/
>        arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/73de8ca9a30642ccef8bb0181bb028d6ea9c49d1/
>     x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c22ca77ba84ba8423883f5e34a28d2c6c3a1ad51/
>        arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e91c4868fa911c7498985c72f2eb7566385764e1/
>     x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/19acd48195857bffd99a703dbe05846a883f792a/
>       i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5f5cc4f4a0d30da582934affba2724aeeb91d7d5/

I've fixed all those ones, they were caused by the introduction of the
SSP support and the toolchain configurations used in the autobuilders
not being up-to-date with this change.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
