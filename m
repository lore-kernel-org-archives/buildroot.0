From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jul 2018 09:19:04 +0200
Subject: [Buildroot] [PATCH v3 00/22] package/x11r7/xserver_xorg-server:
 bump version to 1.20.0
In-Reply-To: <0jjc1fxkra.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Mon, 09 Jul 2018 19:45:36 +0200")
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180703215602.GG2530@scaer>
 <0jjc1fxkra.ln2@ID-313208.user.individual.net>
Message-ID: <87in5jvc0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 >> r128, savage, and sis are all very, very old now. Like, 20 years or
 >> more... I wonder if it makes sense to keep them, given that none of
 >> those three natively cross-compile, and are starting to require patches
 >> to build against a recent X stack. The latter meaning that upstream is
 >> not even test-building those drivers anymore...

 > Up until now and even including the current bump to xserver_xorg-server 
 > 1.20.0 I am still willing to support even the oldest drivers if I can 
 > find the necessary patches somewhere so from my POV it is ok to keep 
 > them. If Thomas or Peter think otherwise I can remove them since I have 
 > no personal interest in them ;)

As long as you care enough about them to keep them working (and the
patches aren't super big/ugly), then I am fine with keeping them.

-- 
Bye, Peter Korsgaard
