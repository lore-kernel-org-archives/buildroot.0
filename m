From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 13:14:32 +0100
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <CALoSW65ULMaHGSw6_rF0WptF_uw-hEAo-LHwO9dcj2T5t8L6ZQ@mail.gmail.com>
 (Nimai Mahajan's message of "Mon, 26 Feb 2018 06:50:50 -0500")
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
 <20180225172619.GA2276@scaer>
 <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
 <20180225175247.GB2276@scaer>
 <CALoSW678nNChNVY1pJfq7BKxW4f1YfGXXdcgRW8xsYQDSO0XvA@mail.gmail.com>
 <20180225182810.GC2276@scaer> <87woz0rwi2.fsf@dell.be.48ers.dk>
 <CALoSW65ULMaHGSw6_rF0WptF_uw-hEAo-LHwO9dcj2T5t8L6ZQ@mail.gmail.com>
Message-ID: <87sh9orlqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nimai" == Nimai Mahajan <nimaim@gmail.com> writes:

Hi,


 >> Correct, so this IMHO means we need to move to 5.9 for the LTS version
 >> by the time we release Buildroot 2019.02, unless something changes - But
 >> until then I would prefer to keep 5.6.

 > Sounds good. People that require this version in the future can simply
 > patch/port this package. At the very least, we should track the latest
 > 5.9.x for BR 2018.02 LTS then (as it seems that release will include 5.6.x
 > and 5.9.x). I believe that is currently 5.9.4, with 5.9.5 coming in March.
 > Their patch version updates contain hundreds of bug fixes. Thanks.

Indeed. Care to send a patch bumping the 5.9 version to 5.9.4 for master?

-- 
Bye, Peter Korsgaard
