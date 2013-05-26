From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 May 2013 22:48:13 +0200
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
	package
In-Reply-To: <20130516163836.3a457466@skate> (Thomas Petazzoni's message of
 "Thu, 16 May 2013 16:38:36 +0200")
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
 <20130516095842.78066d20@skate>
 <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
 <20130516162216.299938c4@skate>
 <CAEBucnD5w4PEHBYe771cqTyy2i7h0yRZ5Fh+Bb3PVymt3W2=MA@mail.gmail.com>
 <20130516163836.3a457466@skate>
Message-ID: <87r4gteacy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> If we were to do a cleanup. I'd actually argue that the entire
 >> multimedia directory needs to go away. Gstreamer/gstreamer1 would need
 >> their own directories but everything else could be in the root.

 Thomas> Right. Peter also like to have everything at the root, so I
 Thomas> believe he will most likely not object to such a move.

Indeed. I tend to make the same mistake as Thomas and only look directly
under package/ ;)

-- 
Bye, Peter Korsgaard
