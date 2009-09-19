From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Sep 2009 17:15:05 +0200
Subject: [Buildroot] [PATCH 1/6] Remove the "project" feature
In-Reply-To: <1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed\,
	16 Sep 2009 23\:07\:41 +0200")
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k4zvx8xy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> -config BR2_HOSTNAME
 Thomas> -	string "hostname"
 Thomas> -	default "uclibc"
 Thomas> -	help
 Thomas> -	  The hostname string is stored in "/etc/hostname"
 Thomas> -
 Thomas> -config BR2_BANNER
 Thomas> -	string "banner"
 Thomas> -	default "Welcome to Buildroot"
 Thomas> -	help
 Thomas> -	  The banner string is stored in "/etc/issue"

I'm not sure removing these is a good idea. They are imho nice to get a
"little bit" of customization without having to have a dedicated
target_skeleton. Perhaps we should move them to target/device/generic
similar to the serial console stuff we already have?

-- 
Bye, Peter Korsgaard
