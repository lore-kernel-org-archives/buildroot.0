From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 11:09:51 +0200
Subject: [Buildroot] [PATCH 20/23] uclibc: move configuration options
	into the package
In-Reply-To: <1372620553-11416-21-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:10 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2qyn128.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In preparation for the introduction of the eglibc library to
 Thomas> the internal toolchain backend, the options that allow to
 Thomas> enable/disable C library features such as largefile, IPv6, RPC
 Thomas> and so on now belong to the uClibc package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
