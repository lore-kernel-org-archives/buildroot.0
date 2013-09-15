From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:07:47 +0200
Subject: [Buildroot] [PATCHv2 07/14] toolchain: add support for glibc
In-Reply-To: <1378138000-12739-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:33 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u4pkd3w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The support for eglibc 2.17 was added to the internal toolchain
 Thomas> backend for 2013.08. This commit now adds glibc 2.18 support to the
 Thomas> internal toolchain backend.

 Thomas> Since the building procedure is very similar to the one of eglibc, we
 Thomas> have renamed the 'eglibc' package to 'glibc', and made it capable of
 Thomas> handling either glibc or eglibc.

Committed, thanks.

-- 
Bye, Peter Korsgaard
