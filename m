From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 23:07:14 +0200
Subject: [Buildroot] [PATCH v3] chrony: new package
In-Reply-To: <1367946979-11619-1-git-send-email-ntl@pobox.com> (Nathan Lynch's
 message of "Tue, 7 May 2013 12:16:19 -0500")
References: <1367946979-11619-1-git-send-email-ntl@pobox.com>
Message-ID: <87vc6uzegt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathan" == Nathan Lynch <ntl@pobox.com> writes:

 Nathan> Signed-off-by: Nathan Lynch <ntl@pobox.com>
 Nathan> ---

 Nathan>  v3: Converted to generic-package due to hand-written configure script
 Nathan>      Use readline and/or libnss if available
 Nathan>      Pass --disable-ipv6 if !BR2_INET_IPV6

Committed, thanks.

-- 
Bye, Peter Korsgaard
