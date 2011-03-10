From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Mar 2011 14:26:38 +0100
Subject: [Buildroot] [PATCH 3/3] busybox 1.18.3: add patches for klogd
	and menuconfig
In-Reply-To: <20110310135756.1031efb0@surf> (Thomas Petazzoni's message of
	"Thu, 10 Mar 2011 13:57:56 +0100")
References: <1299759904-22003-1-git-send-email-gustavo@zacarias.com.ar>
	<1299759904-22003-3-git-send-email-gustavo@zacarias.com.ar>
	<20110310135756.1031efb0@surf>
Message-ID: <87wrk76r8x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Is it really necessary to add Busybox patches all the time, since they
 Thomas> got deprecated pretty quickly by newer releases ? I mean, at the time
 Thomas> of the Buildroot release, it of course make sense to have the latest
 Thomas> Busybox release with the latest fixes, but during the development
 Thomas> phase, is it really useful ?

I personally don't mind the (pretty minimal) churn. I find it a good
thing that git works as good as possible (E.G. fixed for known issues
are included), as it helps testing at all times, not only just before a
release.

-- 
Bye, Peter Korsgaard
