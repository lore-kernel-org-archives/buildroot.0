From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Sep 2016 15:19:59 +0200
Subject: [Buildroot] Build for Odroid-C2 not booting
In-Reply-To: <CAOw_jL1fWrGQHCanQZ_BNXsH3ytiVZ0Kmj4NWNY6paYLXYKT2g@mail.gmail.com>
 (Gaha Bana's message of "Thu, 29 Sep 2016 10:15:51 +0000")
References: <CAOw_jL1fWrGQHCanQZ_BNXsH3ytiVZ0Kmj4NWNY6paYLXYKT2g@mail.gmail.com>
Message-ID: <874m4yzvuo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gaha" == Gaha Bana <gahabana@gmail.com> writes:

 > hi ,
 > i installed fresh buildroot from git, and followed instructions to the
 > letter from
 > https://github.com/buildroot/buildroot/tree/master/board/hardkernel/odroidc2

Notice that URL is not the official location of the Buildroot git tree,
just a mirror.

 > Result burned to SD-Card and when i turn it on, nothing happens - bluelight
 > doesn't even blink just stays on meaning linux kernel hasn't really loaded
 > (stuck on u-boot?)

Do you get any serial output?

 > Could ANYone confirm it works for them ?

I don't have an odroid c2 myself, but very little has changed since the
config was added.

Dagg or Brian, can you confirm or help? Thanks.

-- 
Bye, Peter Korsgaard
