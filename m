From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 22:12:14 +0200
Subject: [Buildroot] [PATCH v4 01/11] pkg-cmake.mk: refactor the
	toolchainfile.cmake generation
In-Reply-To: <1401614673-3703-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 1 Jun 2014 11:24:23 +0200")
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-2-git-send-email-s.martin49@gmail.com>
Message-ID: <877g504cf5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This patch introduces a toolchainfile.cmake.in template which is filled
 > by Buildroot.

 > Using a toolchainfile.cmake.in template file allows to avoid overloading
 > quoting and/or escaping and it becomes much more similar to the
 > resulting file.

 > This patch also cleans up the quoting style.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Baruch Siach <baruch@tkos.co.il>

Committed with the stdin redirect changed as suggested by Thomas, thanks.

-- 
Bye, Peter Korsgaard
