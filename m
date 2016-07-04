From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 10:31:12 +0200
Subject: [Buildroot] [PATCH] support/download: don't be over-remove file
	from git archives
In-Reply-To: <1467618745-1231-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 4 Jul 2016 09:52:25 +0200")
References: <1467618745-1231-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87twg5kdnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we now manually create git archives, we remove all .git-related
 > files. However, we also exclude empty directories.

 > This means that a directory which only had a .gitignore file is excluded
 > from the archive.

 > Fixes:
 >     http://autobuild.buildroot.org/results/2aa/2aa8954311f009988880d27b6e48af91bc74c346/
 >     http://autobuild.buildroot.org/results/b45/b45cceea99b9860ccf1c925eeda498a823b30903/
 >     http://autobuild.buildroot.org/results/5ae/5ae336052fd32057d9631649279e142a81f5651f/
 >     http://autobuild.buildroot.org/results/5fc/5fc3abf4a1aea677f576e16c49253d00720a8bef/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
