From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 19:55:31 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: Update has for COPYING
In-Reply-To: <CAFOYHZBeooStZjidQKJK4Zxdt-xFqdwVjUm2OCjdsdy6nm9Jcg@mail.gmail.com>
References: <20200319081228.26547-1-judge.packham@gmail.com>
 <CAFOYHZBeooStZjidQKJK4Zxdt-xFqdwVjUm2OCjdsdy6nm9Jcg@mail.gmail.com>
Message-ID: <20200320185531.GL10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2020-03-20 21:59 +1300, Chris Packham spake thusly:
> Just noticed the typo in the subject. Can it be fixed up before it's applied or should i send a v2?

Gah, I also mnoticed, and forgot to fix before I pushed.

However, I still expanded on the commit log, to provide moire
explanations on what changed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> On Thu, 19 Mar 2020, 9:12 PM Chris Packham, < [1]judge.packham@gmail.com> wrote:
> 
>   Some of the text was updated in syslog-ng-3.26.1. Update the hash
>   accordingly.
> 
>   Fixes:
>   ?- [2]http://autobuild.buildroot.net/results/4e0768a5aae0f77e1382108b1ca06d0ad78f4da4
>   ?- [3]http://autobuild.buildroot.net/results/7430550dfce0bcb1bc5c9361033e26651883685a
>   ?- [4]http://autobuild.buildroot.net/results/56afedff96d17ab4800845d7777dd151cb431acf
>   ?- [5]http://autobuild.buildroot.net/results/2cac7eeaeabf8d77724ff283d3cb9026e778635c
>   ?- [6]http://autobuild.buildroot.net/results/a8189eab2a14cc5d04d90d8f1fa058b86889cc21
> 
>   Signed-off-by: Chris Packham < [7]judge.packham@gmail.com>
>   ---
>   ?package/syslog-ng/syslog-ng.hash | 2 +-
>   ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
>   diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
>   index a752db0016..edb7efe195 100644
>   --- a/package/syslog-ng/syslog-ng.hash
>   +++ b/package/syslog-ng/syslog-ng.hash
>   @@ -1,5 +1,5 @@
>   ?# Locally computed
>   ?sha256 90214223864df252cea80dbb35c88a2464edcbbb2c9fbc6f6f6c13ee60cb62cd? syslog-ng-3.26.1.tar.gz
>   -sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607? COPYING
>   +sha256 e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b? COPYING
>   ?sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2? GPL.txt
>   ?sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551? LGPL.txt
>   --
>   2.25.1
> 
> Links:
> 1. mailto:judge.packham at gmail.com
> 2. http://autobuild.buildroot.net/results/4e0768a5aae0f77e1382108b1ca06d0ad78f4da4
> 3. http://autobuild.buildroot.net/results/7430550dfce0bcb1bc5c9361033e26651883685a
> 4. http://autobuild.buildroot.net/results/56afedff96d17ab4800845d7777dd151cb431acf
> 5. http://autobuild.buildroot.net/results/2cac7eeaeabf8d77724ff283d3cb9026e778635c
> 6. http://autobuild.buildroot.net/results/a8189eab2a14cc5d04d90d8f1fa058b86889cc21
> 7. mailto:judge.packham at gmail.com

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
