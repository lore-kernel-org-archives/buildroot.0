From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 21:48:16 +0100
Subject: [Buildroot] [PATCH] proxychains: bump to version 4.4
In-Reply-To: <1358254286-5057-1-git-send-email-stefan.froberg@petroprogram.com>
 ("Stefan =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Tue, 15 Jan 2013
 14:51:26 +0200")
References: <1358254286-5057-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <87y5fukwa7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Looks, good, just one question..

 Stefan> -PROXYCHAINS_SITE = http://downloads.sourceforge.net/project/proxychains/proxychains/version%20$(PROXYCHAINS_VERSION)
 Stefan> +PROXYCHAINS_VERSION = 4.4
 Stefan> +PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.bz2
 Stefan> +PROXYCHAINS_SITE = http://codu.org/~rofl/tarballs

I see the sourceforge.net site is still up. Is that still the official
upstream location or do we need to change the url in Config.in?

I see there's also a proxychains on github, but it doesn't have a 4.4
tag. Where did you get this codu.org URL from?

-- 
Bye, Peter Korsgaard
