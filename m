From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 14:11:31 +0200
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: drop NPTL dependency
In-Reply-To: <20180926182045.28484-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 26 Sep 2018 20:20:45 +0200")
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
 <20180926182045.28484-2-fontaine.fabrice@gmail.com>
Message-ID: <87zhw3uolo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
 > for non NPTL configurations.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
