From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 May 2012 23:42:34 +0200
Subject: [Buildroot] [PATCH] apr: requires shared library support
In-Reply-To: <1337282805-8551-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 17 May 2012 21:26:45 +0200")
References: <1337282805-8551-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8762bupjqt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The apr library requires shared library support unconditionally, so
 Thomas> make it depend on !BR2_PREFER_STATIC_LIB, so that architectures that
 Thomas> support static libraries only do not make this package available.

Committed, thanks.

-- 
Bye, Peter Korsgaard
