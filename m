From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 May 2015 09:06:35 +0200
Subject: [Buildroot] [PATCH] package/ola: fix autoreconf issue for
	host-ola
In-Reply-To: <1430525691-4810-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 2 May 2015 02:14:51 +0200")
References: <1430525691-4810-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87twvvtq4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > CXX variable is overwritten with an empy value when
 > host-autoconf-archive package has been installed before
 > host-ola.

 > config.log:
 > configure:19965:  -o conftest -O2 [snip -I and -L] conftest.cpp  -ldl

 > Fixes:
 > http://autobuild.buildroot.net/results/8fa/8fa0a64422a96023a926412a033d9a4f01af5a71/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
