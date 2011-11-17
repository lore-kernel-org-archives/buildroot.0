From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Nov 2011 23:20:50 +0100
Subject: [Buildroot] [PATCH 4 of 5 RFC] dependencies: remove unused lzma
	checking scripts
In-Reply-To: <8cb6371f26ea9b9af34f.1320911669@devws108> (Thomas De
 Schampheleire's message of "Thu, 10 Nov 2011 20:32:00 +0100")
References: <patchbomb.1320911665@devws108>
 <8cb6371f26ea9b9af34f.1320911669@devws108>
Message-ID: <87aa7u9yrh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Files package/lzma/lzmacheck.sh and
 Thomas> toolchain/dependencies/check-host-lzma.sh are present since the
 Thomas> very beginning of buildroot, but do not appear to be used
 Thomas> (anymore). Let's remove them.

Committed, thanks.

-- 
Bye, Peter Korsgaard
