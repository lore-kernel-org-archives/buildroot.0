From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:21:24 +0200
Subject: [Buildroot] [PATCH] package/libcamera: bump to version
 caf25dc5cfd11b965316f02610d49ae3d886716b
In-Reply-To: <20190625215617.10817-1-kieran.bingham@ideasonboard.com> (Kieran
 Bingham's message of "Tue, 25 Jun 2019 22:56:17 +0100")
References: <20190625215617.10817-1-kieran.bingham@ideasonboard.com>
Message-ID: <87r272cql7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kieran" == Kieran Bingham <kieran.bingham@ideasonboard.com> writes:

 > Buildroots autobuild identified a failure on GCC v6.2 and GCC v6.3,
 > producing the following warning (reported as error due to -Werror):

 >   event_dispatcher_poll.cpp:231:13: error: types may not be defined
 >       in a for-range-declaration [-Werror]

 >               for (const struct pollfd &pfd : pollfds) {
 >                          ^~~~~~
 >               cc1plus: all warnings being treated as errors

 > A fix has been integrated upstream, bump the package to incorporate it.

 > Fixes: http://autobuild.buildroot.net/results/f6dd4c60c04892c8b1669e6000fce7edb2b6349e/

 > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
