From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2015 23:34:52 +0100
Subject: [Buildroot] [PATCH 2/2 for 2015.11.x] package/gawk: do not use
	readeline ormpfr in host variant
In-Reply-To: <20151202221602.GK5773@free.fr> (Yann E. MORIN's message of "Wed, 
 2 Dec 2015 23:16:02 +0100")
References: <cover.1449008170.git.yann.morin.1998@free.fr>
 <9cd7b6bdd9790d4105829b278c0e6acba9f103f3.1449008170.git.yann.morin.1998@free.fr>
 <20151201232249.57de6d15@free-electrons.com>
 <20151202221602.GK5773@free.fr>
Message-ID: <87r3j4eayb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> > -# We don't have a host-busybox
 >> > +# We don't have a host-busybox, and we don't want to use mpfr
 >> 
 >> Is the comment really important, especially when it talks about mpfr
 >> but not about readline ?

 > Or just append 'or readline' to the comment.

But we _DO_ have a host-readline?

-- 
Bye, Peter Korsgaard
