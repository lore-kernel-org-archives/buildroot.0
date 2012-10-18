From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Oct 2012 09:10:12 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: vendor part of
	tuple should be 'buildroot'
In-Reply-To: <1350510369-15364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 17 Oct 2012 23:46:09 +0200")
References: <1350510369-15364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gqoqmqz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since 11017f081fc5b034e680d89eaea729c19f450e01, the Crosstool-ng
 Thomas> backend generates toolchains that have a prefix inconsistent with what
 Thomas> Buildroot expects. Buildroot expects a "buildroot" vendor name, while
 Thomas> Crosstool-NG builds toolchain with the "unknown" vendor name.

 Thomas> This is causing build failure such as:

 Thomas>   http://autobuild.buildroot.org/results/15b2c0e50a81b86dd13af684c9254df2bc0df8de/build-end.log

 Thomas> Fix this by changing the vendor part of the tuple used by Crosstool-NG
 Thomas> to "buildroot".

Committed, thanks.

-- 
Bye, Peter Korsgaard
