From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:27:51 +0200
Subject: [Buildroot] [PATCH] mpd: bump to version 0.20.9
In-Reply-To: <20170627093730.17503-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 27 Jun 2017 11:37:30 +0200")
References: <20170627093730.17503-1-joerg.krause@embedded.rocks>
Message-ID: <87d19nerag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Building version 0.20.7 fails with a GCC 4.9 toolchain:
 > ```
 > src/Main.cxx:125:23: error: call to non-constexpr function 'const _Tp& std::max(const _Tp&, const _Tp&) [with _Tp = long unsigned int]'
 >           64 * KILOBYTE);
 >                        ^
 > make[3]: *** [src/Main.o] Error 1
 > ```

 > The issue was reported upstream [1] and already fixed in version 0.20.8.

 > Fixes:
 > http://autobuild.buildroot.net/results/fb6/fb67f453683078023e9d801176ef6871bc720c67/
 > http://autobuild.buildroot.net/results/200/2005f2a7f2857e59ad1a896db0421bb0328b1766/
 > http://autobuild.buildroot.net/results/804/80410b62d4ca292df8ecbaf7b0e2a020767111b6/

 > [1] https://github.com/MusicPlayerDaemon/MPD/issues/45

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
