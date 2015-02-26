From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:09:32 +0100
Subject: [Buildroot] [PATCH v2] package/libsrtp: fix static build with
	openssl
In-Reply-To: <1424986206-9552-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Thu, 26 Feb 2015 22:30:06 +0100")
References: <1424986206-9552-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87zj80495v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > libsrp forget to link with zlib for static build when openssl

s/libsrp/libsrtp/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
