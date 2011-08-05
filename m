From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Aug 2011 09:46:24 +0200
Subject: [Buildroot] libssp still missing from target
In-Reply-To: <20110805003419.4934e4bf@skate> (Thomas Petazzoni's message of
 "Fri, 5 Aug 2011 00:34:19 +0200")
References: <j1eiv7$irk$1@dough.gmane.org> <20110805003419.4934e4bf@skate>
Message-ID: <87ei10mhbj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I guess libssp only exists on toolchains that have stack
 Thomas> protection support enabled. None of my CodeSourcery or
 Thomas> Buildroot-built toolchains have a libssp. I guess I'll have to
 Thomas> build a CT-NG toolchain with libssp support.

We do have a BR2_TOOLCHAIN_BUILDROOT_USE_SSP option for the internal
toolchain.

-- 
Bye, Peter Korsgaard
