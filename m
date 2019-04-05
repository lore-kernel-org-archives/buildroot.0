From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:29:09 +0200
Subject: [Buildroot] [PATCH] package/dovecot: security bump to version
 2.3.5.1
In-Reply-To: <20190330195352.32164-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 Mar 2019 20:53:52 +0100")
References: <20190330195352.32164-1-peter@korsgaard.com>
Message-ID: <87h8bcsc6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 >  * CVE-2019-7524: Missing input buffer size validation leads into
 >    arbitrary buffer overflow when reading fts or pop3 uidl header
 >    from Dovecot index. Exploiting this requires direct write access to
 >    the index files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x (and the corresponding dovecot-pigeonhole bump), thanks.

-- 
Bye, Peter Korsgaard
