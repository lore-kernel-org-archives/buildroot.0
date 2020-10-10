From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 21:44:07 +0200
Subject: [Buildroot] [git commit] package/vlc: fix build with live555
 and without openssl
In-Reply-To: <20201004103503.549A28E4F9@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 4 Oct 2020 12:45:09 +0200")
References: <20201004103503.549A28E4F9@busybox.osuosl.org>
Message-ID: <87imbhg92w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=e0fb418f781b69b8a0a0c953bf00a2965d675c43
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Pass -DNO_OPENSSL to avoid a build failure with live555 but without
 > openssl

 > Fixes:
 >  - http://autobuild.buildroot.org/results/70ca93aa5c9488a4657c7bcafa40bfb2e974a5b3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
