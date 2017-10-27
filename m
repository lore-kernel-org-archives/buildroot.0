From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 13:49:28 +0200
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.6p1
In-Reply-To: <20171026125247.1044-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 26 Oct 2017 14:52:47 +0200")
References: <20171026125247.1044-1-peter@korsgaard.com>
Message-ID: <87vaj0olo7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-15906 - The process_open function in sftp-server.c in OpenSSH
 > before 7.6 does not properly prevent write operations in readonly mode,
 > which allows attackers to create zero-length files.

 > For more details, see the release notes:
 > https://www.openssh.com/txt/release-7.6

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
