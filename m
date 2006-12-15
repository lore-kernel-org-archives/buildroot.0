From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 15 Dec 2006 15:43:57 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <200612151531.04658.uli@suse.de>
References: <20061215133926.E32D74857D@busybox.net>
	<200612151531.04658.uli@suse.de>
Message-ID: <20061215144357.GA14430@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 15, 2006 at 03:31:04PM +0100, Ulrich Hecht wrote:
>Hi!
>
>On Friday 15 December 2006 14:39, aldot at uclibc.org wrote:
>> Log:
>> - Only care about the locale stuff if we have locale in the first
>> place.
>[...]
>> +ifneq ($(UCLIBC_HAS_LOCALE),)
>
>I guess that should have been BR2_ENABLE_LOCALE. UCLIBC_HAS_LOCALE is 
>from the uClibc config file.

Right. Thanks for spotting this..
