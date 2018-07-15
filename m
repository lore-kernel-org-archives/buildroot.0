From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 17:46:04 +0200
Subject: [Buildroot] [PATCH v3 00/22] package/x11r7/xserver_xorg-server:
 bump version to 1.20.0
In-Reply-To: <87in5jvc0n.fsf@dell.be.48ers.dk>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180703215602.GG2530@scaer>
 <0jjc1fxkra.ln2@ID-313208.user.individual.net>
 <87in5jvc0n.fsf@dell.be.48ers.dk>
Message-ID: <20180715154604.GC2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-07-13 09:19 +0200, Peter Korsgaard spake thusly:
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>  >> r128, savage, and sis are all very, very old now. Like, 20 years or
>  >> more... I wonder if it makes sense to keep them, given that none of
>  >> those three natively cross-compile, and are starting to require patches
>  >> to build against a recent X stack. The latter meaning that upstream is
>  >> not even test-building those drivers anymore...
>  > Up until now and even including the current bump to xserver_xorg-server 
>  > 1.20.0 I am still willing to support even the oldest drivers if I can 
>  > find the necessary patches somewhere so from my POV it is ok to keep 
>  > them. If Thomas or Peter think otherwise I can remove them since I have 
>  > no personal interest in them ;)
> 
> As long as you care enough about them to keep them working (and the
> patches aren't super big/ugly), then I am fine with keeping them.

I'm also fine with keeping them if someone is actually caring for them.
But as I sais, maintaining them just for the sake of maintenance,
without actual use, is probably going too far.

But OK, if that is an exercise in style. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
