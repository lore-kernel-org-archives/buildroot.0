From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 22:33:27 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-boards: set a default board
In-Reply-To: <20130605222659.59ab6272@skate> (Thomas Petazzoni's message of
 "Wed, 5 Jun 2013 22:26:59 +0200")
References: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d2s0cqtw.fsf@dell.be.48ers.dk> <20130605213807.0c015c5d@skate>
 <878v2ocpey.fsf@dell.be.48ers.dk> <20130605222659.59ab6272@skate>
Message-ID: <874ndccn6w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> While you're at it, can you change your build result submit
 Thomas> script to no longer include the full build log (it gets deleted
 Thomas> anyway once it arrives on the server, they consume too much
 Thomas> disk space), and increase the length of the "build end log" to
 Thomas> 500 lines instead of 100 lines?

Sure, done!

-- 
Bye, Peter Korsgaard
