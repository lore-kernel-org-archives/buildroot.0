From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 21:58:02 +0100
Subject: [Buildroot] [PATCH] package/subversion: security bump to
 version 1.9.10
In-Reply-To: <20190123104030.12528-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 23 Jan 2019 11:40:30 +0100")
References: <20190123104030.12528-1-peter@korsgaard.com>
Message-ID: <87r2cv41wl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Additional fixes for CVE-2017-9800: Malicious server can execute arbitrary
 > command on client and a number of crash fixes.

 > https://svn.apache.org/repos/asf/subversion/tags/1.9.10/CHANGES

 > Drop upstream SHA1 hash as that is no longer listed.  Also add a hash for
 > the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
