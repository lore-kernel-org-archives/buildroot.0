From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Sat, 11 Jul 2015 01:06:15 +0200
Subject: [Buildroot] [PATCH 5/7 v2] busybox: adjust configuration to add
 fancy options to the sleep applet
In-Reply-To: <20150711005826.77335517@free-electrons.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>	<1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
 <20150711005826.77335517@free-electrons.com>
Message-ID: <55A04FE7.10009@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas, Samuel, All,

On 11/07/2015 00:58, Thomas Petazzoni wrote:
> Dear Sylvain Raybaud,
> 
> On Thu,  9 Jul 2015 18:21:59 +0200, Sylvain Raybaud wrote:
>> Set CONFIGURE_FEATURE_FANCY_SLEEP and CONFIG_FEATURE_FLOAT_SLEEP
>> so that sleep accept floating point arguments. This add 492 bytes
>> to the busybox binary compiled for arm or 2748 bytes when
>> compiled for i386.
>> 
>> Signed-off-by: Sylvain Raybaud
>> <sylvain.raybaud@green-communications.fr> --- Changes v1 -> v2: -
>> Add information about the impact on busybox binary size induced
>> by patching busybox.config (suggested by Thomas Petazzoni)
> 
> Applied, thanks.
> 
> Next time, can you remember to wrap your commit log to ~72
> columns?
> 
> Thanks!

Sure thing. Thanks! Working on your other feedback now.

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVoE/nAAoJEEkkwl4JtJ9yVagP/iyHKdM1OVj2tfbsnV4j/CjA
qyD1H+79pZuv7apDfudpVJum52qrSX6pSj08SAFfe7uerBaXp/rDYy3cj1zeSn3c
a+OTHW2/Fw4P5PNruA23QzXWdzEKXvIsURYH248OCTsZRWI+oA94EW9c3Ni/Qz3M
6hExosZprx0/FJqRZQerCj6qDoXSea45Q58CIgdnNOPyE84jdCmJ944jhSUDhsFv
U1t1m7FUzDuB0vXP5IP9jSyTuXafO0b30UijKlLKzghC9zZLaXVE30BlrMvJo8zL
+SP5aNo5MI5kMlW4AchxMgrir5siFnxPD+LR51Zj7cm+QYnnVD8RCJMORCkoc/es
16OpQzOY61cZnlcrvThzGptJQ3a10HcFD4yo68JMVpebp1hP0BjSupgCw4aWyr1T
WVy/QK/VimyOxkgrcPDVeLQCdzypCoPtRarb+eiaiCDIJ245IIWvwi9wNq2YHNbS
a27r1CaBdl31HN4a8a8QNqgGrJ+uvHDaeBS7Gyd0oUG2can1dh6Ht6+GeTKnhgdF
rLFW9DYSehvxTEvNwldYQ/wUUKJCvCzQd0K7K1S1dhG0p1h/XM5J+Lt7Y3LQoinc
k7kEHV+TvWGKUi9LLLMPtXtnWKqWqTk8bik1cwg4vdz21GLULwXzt/U2KtUsocmb
75D4p5oKYZm/swI0WrK7
=ig9O
-----END PGP SIGNATURE-----
