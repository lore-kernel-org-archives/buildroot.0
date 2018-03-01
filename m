From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 19:50:03 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180301180639.GA2449@scaer> (Yann E. MORIN's message of "Thu, 1
 Mar 2018 19:06:39 +0100")
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180228213104.GA16465@scaer> <20180228231347.1e2896a2@windsurf.lan>
 <20180301180639.GA2449@scaer>
Message-ID: <87y3jbhbqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Ah, yes, you're right, sorry...

 > I was confused now, because (without this patch) I had to change my
 > locale to be able to build systemd. My bad, sorry...

Wait, are you saying that it doesn't build with en_GB.UTF-8 locale?
That's odd.

-- 
Bye, Peter Korsgaard
