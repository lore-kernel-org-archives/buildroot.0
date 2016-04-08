From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 12:10:59 +0200
Subject: [Buildroot] [PATCH v3 05/10] toolchain-buildroot: don't show
	musl on noMMU platforms
In-Reply-To: <1459450815-6494-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:10 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87inzspg0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > While musl has recently gained noMMU support for the sh2 platform, we
 > don't support this yet. So for the time being, let's not show musl as
 > an available C library on noMMU platforms. This is for example
 > important on ARM noMMU: ARM is supported by musl, but not its noMMU
 > variants.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
