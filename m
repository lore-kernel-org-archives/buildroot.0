From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 22:58:51 +0100
Subject: [Buildroot] [PATCH 1/1] host util-linux: disable login and su
	since they depend on PAM
In-Reply-To: <1363018777-13122-1-git-send-email-cvubrugier@lacie.com>
 (Christophe Vu-Brugier's message of "Mon, 11 Mar 2013 17:19:37 +0100")
References: <1363018777-13122-1-git-send-email-cvubrugier@lacie.com>
Message-ID: <87hak8xtd0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christophe" == Christophe Vu-Brugier <cvubrugier@lacie.com> writes:

 Christophe> This fixes the following errors when building util-linux
 Christophe> v2.22.2 for the host in case the PAM headers are missing:

Committed, thanks.

-- 
Bye, Peter Korsgaard
