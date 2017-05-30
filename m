From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 14:32:08 +0200
Subject: [Buildroot] genimage maintainers
In-Reply-To: <1496138688562-165972.post@n4.nabble.com> (hkengblom@gmail.com's
 message of "Tue, 30 May 2017 03:04:48 -0700 (PDT)")
References: <1496138688562-165972.post@n4.nabble.com>
Message-ID: <8760gia5kn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hkengblom" == hkengblom  <hkengblom@gmail.com> writes:

Hi,

 > I've made a patch for it, but I don't know where to send it, or make
 > a pull-request. Further, I'm not that familiar with genimage, so it
 > would be good if someone with more insight in genimage could take a
 > look at it.

 > Can anyone point me to someone that might be the "receiver" of such a
 > patch?

Sorry, I have never used this mountpoint option (and it isn't directly
clear to me what it does), but the upstream git repo for genimage is at:

git://git.pengutronix.de/git/genimage.git

And looking at the git history, the most active developers looks to be:

git shortlog -sne | head -n 3
    84  Michael Olbrich <m.olbrich@pengutronix.de>
    15  Juergen Beisert <jbe@pengutronix.de>
    15  Sascha Hauer <s.hauer@pengutronix.de>

So perhaps mailing them is the best way forward.

-- 
Bye, Peter Korsgaard
