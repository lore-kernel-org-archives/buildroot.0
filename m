From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 11:11:30 +0100
Subject: [Buildroot] allyespackageconfig build on ARM/Linaro
In-Reply-To: <20121218104040.7f5f3c79@skate> (Thomas Petazzoni's message of
 "Tue, 18 Dec 2012 10:40:40 +0100")
References: <20121218100954.2d59c70f@skate> <878v8v7lwq.fsf@dell.be.48ers.dk>
 <20121218104040.7f5f3c79@skate>
Message-ID: <87zk1b6565.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Strange about all these linker issues.

 Thomas> No, not really strange. There has been a change in gcc 4.6 with
 Thomas> regard to linking some time ago. See
 Thomas> http://www.gentoo.org/proj/en/qa/asneeded.xml. This is causing
 Thomas> build breakage in some packages that had an incorrect list of
 Thomas> libraries to link with.

But is --as-needed now default, or is that something special to the
Linaro toolchain? We also default to 4.6 with the internal toolchain,
and I don't recall those linker issues.

-- 
Bye, Peter Korsgaard
