From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:59:16 +0100
Subject: [Buildroot] [PATCH] package/ntfs-3g: add upstream security fix
 for CVE-2019-9755
In-Reply-To: <20200204155031.5504-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Feb 2020 16:50:31 +0100")
References: <20200204155031.5504-1-peter@korsgaard.com>
Message-ID: <87y2s8ncyj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
 > A local attacker could potentially exploit this by running /bin/ntfs-3g with
 > specially crafted arguments from a specially crafted directory to cause a
 > heap buffer overflow, resulting in a crash or the ability to execute
 > arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
 > binary, this could lead to a local escalation of privileges.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
