From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 May 2018 17:26:35 +0200
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180505150621.GB14524@scaer> (Yann E. MORIN's message of "Sat, 
 5 May 2018 17:06:21 +0200")
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer> <87po2aupu4.fsf@dell.be.48ers.dk>
 <20180505150621.GB14524@scaer>
Message-ID: <87d0yaunro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Why? Overlays is the the recommended way to add/override stuff, and the
 >> 'everything-you-put-in-the-overlay-will-override-the-buildroot-defaults'
 >> is a pretty nice and easy to understand behaviour.

 > Well, I disagree quite a bit: overlays are ugly and 99% of what users
 > do with an overlay can be done with a package (i.e. adding data blobs).
 > The remaining 1% can be done with a post-build script.

 > Besides, what you put in an overlay is never accoutnted for: no
 > graph-size, no legal-info, no nothing...

 > Repeat after me: overlays are ugly! ;-)

 > Two things that overlays are noce for:

 >   - provide /etc/-style config files to be written over the default ones,

 >   - provide test-data that is not supposed to go into production, and
 >     for which a package may be a bit overkill, and even then...

 > Otherwise, overlays are just a pita and, long term, are a liability...

Do you feel better now? ;) I agree that they can be abused - But don't
forget, overlays were added to get people away from custom skeletons. I
still find overlays quite a bit nicer than custom skeletons.

-- 
Bye, Peter Korsgaard
