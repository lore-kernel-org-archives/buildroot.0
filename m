From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Oct 2012 17:16:34 +0100
Subject: [Buildroot] [PATCH] squid: bump to version 3.2.3
In-Reply-To: <1351544236-23479-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 29 Oct 2012 17:57:16 -0300")
References: <1351544236-23479-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txtcgckd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/squid/Config.in |    2 ++
 Gustavo>  package/squid/squid.mk  |   24 +++++++++++++++++-------
 Gustavo>  2 files changed, 19 insertions(+), 7 deletions(-)

This seems to have caused some build failures:

http://autobuild.buildroot.net/results/c9e590a1034c3869cb7391984ce8281ec4c3ef9c/build-end.log

http://autobuild.buildroot.net/results/7f8201ebcafd611cab95788e030b768fa84ad28b/build-end.log

The 2nd you can probably not do much about though.

-- 
Bye, Peter Korsgaard
