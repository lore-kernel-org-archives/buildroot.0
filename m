From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 09:22:13 +0100
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <20180225182810.GC2276@scaer> (Yann E. MORIN's message of "Sun,
 25 Feb 2018 19:28:10 +0100")
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
 <20180225172619.GA2276@scaer>
 <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
 <20180225175247.GB2276@scaer>
 <CALoSW678nNChNVY1pJfq7BKxW4f1YfGXXdcgRW8xsYQDSO0XvA@mail.gmail.com>
 <20180225182810.GC2276@scaer>
Message-ID: <87woz0rwi2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Nimai, All,
 > On 2018-02-25 18:10 +0000, Nimai Mahajan spake thusly:
 >> That's fine, but keep in mind this will never be as stable as their LTS
 >> releases, where they are constantly fixing bugs (5.9 is supposed to be
 >> supported til 2020, whereas 5.11 will come out in May and deprecate 5.10).
 >> Latest branch just keeps getting new > features thrown in it without fixes
 >> to existing ones.

 > 5.6 is supposed to be maintained for three years after being introduced,
 > that is 2016-03-16 [0], which brings us toward 2019-03-16 as well, so a
 > bit more than a year still. ;-)

 > [0] https://www1.qt.io/qt-news/20578/

Correct, so this IMHO means we need to move to 5.9 for the LTS version
by the time we release Buildroot 2019.02, unless something changes - But
until then I would prefer to keep 5.6.

-- 
Bye, Peter Korsgaard
