From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 21:50:30 +0100
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <20130116145510.66bdf069@skate> (Thomas Petazzoni's message of
 "Wed, 16 Jan 2013 14:55:10 +0100")
References: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
 <1358351378-10876-2-git-send-email-bogdan@nimblex.net>
 <20130116145510.66bdf069@skate>
Message-ID: <87622rd1ex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> No, selecting toolchain options is not correct, and in this particular
 Thomas> case, it would only work for the internal toolchain backend (breaking
 Thomas> the external backend and Crosstool-NG backend).

 Thomas> See package/squid/Config.in for an example.

 Thomas> Basically, you must do something like:

 Thomas> config BR2_PACKAGE_FOO
 Thomas> 	depends on BR2_INET_IPV6

 Thomas> comment "foo requires IPv6 support in toolchain"
 Thomas> 	depends on !BR2_INET_IPV6

Bogdan, care to resend with the issues pointed out by me and Thomas
fixed?

-- 
Bye, Peter Korsgaard
