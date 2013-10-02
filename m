From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 17:02:22 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <20131001144009.4117ea4c@skate> (Thomas Petazzoni's message of
 "Tue, 1 Oct 2013 14:40:09 +0200")
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
 <20131001144009.4117ea4c@skate>
Message-ID: <87wqlvpvgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The thing that worries me is that we start to rely on uClibc
 Thomas> features that are provided by specific patches we have added to
 Thomas> our uClibc package. This means that an user using an uClibc
 Thomas> toolchain provided by Analog Devices for Blackfin, or built
 Thomas> with Crosstool-NG will no longer work properly to build those
 Thomas> packages.

As uClibc is configurable, this can never be 100% safe, but I agree we
should try to keep these things to a minimum.

 Thomas> I'm not sure what to do about this, though. Mark those packages as
 Thomas> available only with glibc or the internal uClibc toolchain? Stop
 Thomas> backporting uClibc feature patches (like we do for other packages) and
 Thomas> tell people to work with upstream uClibc to get things fixed and
 Thomas> released?

A new uClibc release would be very good, yes.

-- 
Bye, Peter Korsgaard
