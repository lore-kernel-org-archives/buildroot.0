From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 18:05:42 +0200
Subject: [Buildroot] [PATCH] package/luksmeta: bump to version v9
In-Reply-To: <20190912201438.9985-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Sep 2019 22:14:37 +0200")
References: <20190912201438.9985-1-peter@korsgaard.com>
Message-ID: <875zlgmkdl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfix release, fixing a potential infinite loop when handling the LUKS
 > header:

 > git shortlog v8..v9
 > Daniel Kope?ek (2):
 >       Use asciidoc as the manual page source format
 >       Generate manual page from source during build time

 > Milan Broz (1):
 >       Fix infinite loop when initializing trimmed LUKS header.

 > Nathaniel McCallum (3):
 >       Fix invalid man page section reference
 >       Fix typos in the man page
 >       Release version 9

Given the fixes, committed to 2019.02.x, 2019.05.x and 2019.08.x.

-- 
Bye, Peter Korsgaard
