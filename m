From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 21:54:17 +0100
Subject: [Buildroot] [PATCH 01/34] pcre: add support for 16 bits and 32
	bits variants
In-Reply-To: <1362601396-32250-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 6 Mar 2013 21:22:43 +0100")
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lia06yh2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, we have been building only the 8bits PCRE
 Thomas> variant. However, Qt5 requires the 16bits variant. This commit
 Thomas> therefore adds support to build the 16bits and 32bits variants
 Thomas> of PCRE. In order to preserve backward compatibility, the 8bits
 Thomas> variant is automatically chosen if no specific variant is
 Thomas> defined.

Committed, thanks.

-- 
Bye, Peter Korsgaard
