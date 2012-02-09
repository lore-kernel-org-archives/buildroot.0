From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 22:10:55 +0100
Subject: [Buildroot] [PATCH 4 of 5 v6] Makefile: change order of dirs
	and dependencies
In-Reply-To: <56de77645492978917b5.1328718139@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 08 Feb 2012 17:22:19 +0100")
References: <patchbomb.1328718135@beantl019720>
 <56de77645492978917b5.1328718139@beantl019720>
Message-ID: <87fwej4srk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> If during the dependencies step, a package needs to be downloaded, the
 Thomas> download directory already has to be present. If not, the file will be
 Thomas> downloaded under the name 'dl' instead of in the directory 'dl'.

 Thomas> This patch changes the order of dirs and dependencies in the
 Thomas> world target to fix this.

Committed, thanks.

-- 
Bye, Peter Korsgaard
