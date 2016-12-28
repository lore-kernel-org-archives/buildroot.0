From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 11:18:47 +0100
Subject: [Buildroot] [PATCH] cryptopp: add upstream security fix for
	CVE-2016-9939
In-Reply-To: <20161227220721.27566-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Dec 2016 23:07:21 +0100")
References: <20161227220721.27566-1-peter@korsgaard.com>
Message-ID: <87k2akbblk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes security issue (DoS) in Crypto++ ASN1 decoder:
 > https://github.com/weidai11/cryptopp/issues/346

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
