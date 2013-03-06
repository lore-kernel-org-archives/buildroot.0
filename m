From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 21:10:32 +0100
Subject: [Buildroot] [PATCH] graph-depends: ignore the
	'target-post-image' target
In-Reply-To: <1362509961-27574-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Mar 2013 19:59:21 +0100")
References: <1362509961-27574-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txoo70hz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since the introduction of the post-image mechanism, the graph-depends
 Thomas> script is broken: it tries to call 'make
 Thomas> target-post-image-show-depends', which doesn't exist since
 Thomas> 'target-post-image' is not a package.

 Thomas> So we should simply ignore this 'target-post-image'.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
