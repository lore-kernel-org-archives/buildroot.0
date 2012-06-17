From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Jun 2012 14:10:14 +0200
Subject: [Buildroot] [PATCH] libfreefare: add missing openssl dependency
In-Reply-To: <20120617103034.GA5839@tarshish> (Baruch Siach's message of "Sun, 
 17 Jun 2012 13:30:35 +0300")
References: <1339924060-4250-1-git-send-email-spdawson@gmail.com>
 <87wr36fdf0.fsf@macbook.be.48ers.dk> <20120617103034.GA5839@tarshish>
Message-ID: <87sjduf8bd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 spdawson> config BR2_PACKAGE_LIBFREEFARE
 spdawson> bool "libfreefare"
 spdawson> +	depends on BR2_PACKAGE_OPENSSL
 >> 
 >> We normally use 'depends on' for library dependencies (like libnfc), so
 >> I've changed that and committed, thanks.

 Baruch> s/depends on/select/

Yes ;)

-- 
Bye, Peter Korsgaard
