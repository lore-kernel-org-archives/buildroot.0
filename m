From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Oct 2017 14:29:55 +0200
Subject: [Buildroot] [PATCH] strongswan: add missing include of stdint.h
In-Reply-To: <1506958267-31934-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 2 Oct 2017 10:31:07 -0500")
References: <1506958267-31934-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87poa4beik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Recent releases of glibc don't include the full stdint.h
 > header in some network headers included by utils.h.
 > Upstream is targetting a 5.6.1 release of the fix.

 > Ustream: https://wiki.strongswan.org/issues/2425

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
