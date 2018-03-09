From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Mar 2018 22:23:39 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: correctly handle license
 dirs in subdirs for .hash files
In-Reply-To: <20180309143043.8287-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Mar 2018 15:30:43 +0100")
References: <20180309143043.8287-1-peter@korsgaard.com>
Message-ID: <87tvtphrj8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > create_hash_file() used basename(licensefile) when it writes the entry for
 > the license file in the .hash, which is obviously not correct when license
 > file is locate in a sub directory.

 > Instead copy the logic from __create_mk_license() to strip the directory
 > prefix from the absolute filename instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


Committed, thanks.

-- 
Bye, Peter Korsgaard
