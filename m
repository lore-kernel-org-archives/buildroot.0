From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 10:27:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-04-09
In-Reply-To: <20210410051120.8E13060665@smtp3.osuosl.org> (Thomas Petazzoni's
 message of "Sat, 10 Apr 2021 05:11:15 -0000")
References: <20210410051120.8E13060665@smtp3.osuosl.org>
Message-ID: <87fszy5yth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > Autobuild statistics for 2021-04-09
 > ===================================

 >       branch |  OK | NOK | TIM | TOT |
 >   2021.02.x  | 30  |  8  |  0  | 38  |
 >     master   | 172 | 76  |  0  | 248 |

 > Classification of failures by reason for master
 > -----------------------------------------------

 >          s6-linux-init-1.0.3.1 | 20
 >         host-sentry-cli-1.57.0 | 4 
 >                   monkey-1.6.9 | 3 
 >                   ndisc6-1.0.4 | 3 
 >               skalibs-2.10.0.2 | 3 
 >                   zeromq-4.3.4 | 3 
 >                belle-sip-4.4.8 | 2 
 > canfestival-7740ac6fdedc23e... | 2
 
 >     arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f9673311f925b352f283393b3ad7a490fe8cdf4c |     
 >    x86_64    | canfestival-7740ac6fdedc23e... | NOK |
 >    http://autobuild.buildroot.net/results/4f9c93c1f585cbc7c36dd1017bc0542

Hmm, something broke with our mercurial support on James' autobuilder?
Any idea?

It still works here:

make canfestival-patch
>>> canfestival 7740ac6fdedc23e1ed6908d3d7db54833c88572b Downloading
real URL is https://hg.beremiz.org/CanFestival-3
requesting all changes
adding changesets
adding manifests
adding file changes
added 809 changesets with 6715 changes to 3480 files
new changesets 4472ee7c6c3e:de1fc3261f21
>>> canfestival 7740ac6fdedc23e1ed6908d3d7db54833c88572b Extracting
gzip -d -c /home/peko/source/buildroot/dl/canfestival/canfestival-7740ac6fdedc23e1ed6908d3d7db54833c88572b.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output-canfestival/build/canfestival-7740ac6fdedc23e1ed6908d3d7db54833c88572b   -xf -
>>> canfestival 7740ac6fdedc23e1ed6908d3d7db54833c88572b Patching
..

James, can you take a look?

-- 
Bye, Peter Korsgaard
