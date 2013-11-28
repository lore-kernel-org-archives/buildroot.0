From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 22:48:19 +0100
Subject: [Buildroot] [PATCH v3 2/2] grantlee: Disable on non-supported
	platforms
In-Reply-To: <1385654237-36389-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 28 Nov 2013 15:57:15 +0000")
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
 <1385654237-36389-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87mwkoxknw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package selects BR2_PACKAGE_QT_SCRIPT which is not supported on 
 > certain platforms. To prevent this behaviour we use the same solution as 
 > we applied for BR2_PACKAGE_QT_SCRIPT

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
