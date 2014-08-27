From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2014 21:31:27 +0200
Subject: [Buildroot] [PATCH] perl-gd: mark as broken
In-Reply-To: <1409140319-9796-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Aug 2014 13:51:59 +0200")
References: <1409140319-9796-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbpdu3u8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > perl-gd doesn't build on gcc10 due to the host Perl being a bit
 > old. This shows a defiency in the perl package infrastructure, which
 > is being worked on. However, since it won't be solved before 2014.08,
 > our only solution for now is to mark perl-gd as broken, as well as its
 > reverse dependency perl-gdgraph.

 > Avoids:

 >   http://autobuild.buildroot.org/results/228/228b43e67e683cecfa3851a8a030d06e9fdc6dac/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
