From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Aug 2009 07:26:32 +0200
Subject: [Buildroot] Enabling IPv6 doesn't enable it in busybox config
In-Reply-To: <4A8524A4.6070107@tandberg.com> (Chris Smith's message of "Fri\,
	14 Aug 2009 09\:47\:32 +0100")
References: <4A8524A4.6070107@tandberg.com>
Message-ID: <87fxbgo453.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Smith <chris.smith@tandberg.com> writes:

 Chris> Shouldn't enabling IPv6 also enable CONFIG_FEATURE_IFUPDOWN_IPV6 in busybox?
 Chris> inet6 addresses in /etc/network/interfaces don't work otherwise.

Yes, fixed in git (4ae691ecb960f)

-- 
Bye, Peter Korsgaard
