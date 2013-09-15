From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:07:34 +0200
Subject: [Buildroot] [PATCHv2 06/14] gcc: move C++ support option next
	to Fortran/Objective-C
In-Reply-To: <1378138000-12739-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:32 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761u1kd49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The option to enable C++ support was still located in
 Thomas> toolchain/toolchain-buildroot/Config.in.2, with misc other toolchain
 Thomas> options. It seems more logical to have this option with the other
 Thomas> options to select the languages supported by the cross-compiler, so we
 Thomas> move it next to the Fortran/Objective-C options in
 Thomas> package/gcc/Config.in.host.

Committed, thanks.

-- 
Bye, Peter Korsgaard
