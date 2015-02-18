From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Feb 2015 23:32:15 +0100
Subject: [Buildroot] [PATCH 1/2] mjpg-streamer: disable for static builds
In-Reply-To: <1424251437-8742-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 18 Feb 2015 09:23:56 +0000")
References: <1424251437-8742-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87twyivok0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package needs to load plugins to do its job. Those plugins are
 > shared objects (.so) which are loaded using 'dlopen()', so it makes no
 > sense to enable this package when doing static builds where 'dlopen()'
 > is not available.

 > Fixes:

 >   http://autobuild.buildroot.net/results/cd5/cd52b739370d57b5ecbc6472b8c7f1126700e85f/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
