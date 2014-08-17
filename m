From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2014 09:09:11 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host-erlang with
	support for openssl
In-Reply-To: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 15 Aug 2014 17:49:15 +0200")
References: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a973zj6w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Erlang uses openssl for all things crypto.
 > Since there are host Erlang tools that use crypto (such as rebar), we
 > need to build host-erlang with support for crypto, and thus it shall
 > depends on openssl.

 > Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Frank Hunleth <fhunleth@troodon-software.com>
 > Cc: Johan Oudinet <johan.oudinet@gmail.com>

 > ---
 > Note: I am not sure whether this is the correct solution, to match the
 > host SSL support to the target SSL support. I'll let the erlang experts
 > enhance that patch if need be. ;-)

Sorry, I must have missed the discussion about this. What exactly does
it fix? Do we need it for 2014.08?

-- 
Bye, Peter Korsgaard
