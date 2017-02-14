From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 11:18:10 +0100
Subject: [Buildroot] [PATCH] vim: security bump to version 8.0.0329
In-Reply-To: <20170213220808.29540-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 13 Feb 2017 23:08:08 +0100")
References: <20170213220808.29540-1-peter@korsgaard.com>
Message-ID: <877f4tkrdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > - CVE-2016-1248: vim before patch 8.0.0056 does not properly validate values
 >   for the 'filetype', 'syntax' and 'keymap' options, which may result in the
 >   execution of arbitrary code if a file with a specially crafted modeline is
 >   opened.

 > - CVE-2017-5953: vim before patch 8.0.0322 does not properly validate values
 >   for tree length when handling a spell file, which may result in an integer
 >   overflow at a memory allocation site and a resultant buffer overflow.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
