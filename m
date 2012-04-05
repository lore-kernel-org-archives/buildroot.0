From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Apr 2012 16:40:18 +0200
Subject: [Buildroot] [PATCH] valgrind: allow selecting which tools to
	install
In-Reply-To: <3d26fc988e01a367dd05.1331743859@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 14 Mar 2012 17:50:59 +0100")
References: <3d26fc988e01a367dd05.1331743859@beantl019720>
Message-ID: <87hawys0ml.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The full valgrind installation takes more than 20 MB, while one
 Thomas> typically does not use all of its tools. This patch adds extra
 Thomas> config options to select which tools to install.

Committed with Arnout's suggestion to not default the experimental tools
to 'y' - Thanks.

-- 
Bye, Peter Korsgaard
