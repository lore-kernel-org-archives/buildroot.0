From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 10:27:28 +0100
Subject: [Buildroot] [PATCH] package/glibc: bump version for post-2.30
 security fixes
In-Reply-To: <20191213135552.27664-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 13 Dec 2019 14:55:52 +0100")
References: <20191213135552.27664-1-peter@korsgaard.com>
Message-ID: <87pngfv1bz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2019-19126: ld.so failed to ignore the LD_PREFER_MAP_32BIT_EXEC
 >   environment variable during program execution after a security
 >   transition, allowing local attackers to restrict the possible mapping
 >   addresses for loaded libraries and thus bypass ASLR for a setuid
 >   program.  Reported by Marcin Ko?cielnicki.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.11.x, thanks.

For 2019.02.x I will instead bump the 2.28.x version for the same fix.

-- 
Bye, Peter Korsgaard
