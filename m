From: Ulrich Hecht <uli@suse.de>
Date: Fri, 15 Dec 2006 15:31:04 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20061215133926.E32D74857D@busybox.net>
References: <20061215133926.E32D74857D@busybox.net>
Message-ID: <200612151531.04658.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Friday 15 December 2006 14:39, aldot at uclibc.org wrote:
> Log:
> - Only care about the locale stuff if we have locale in the first
> place.
[...]
> +ifneq ($(UCLIBC_HAS_LOCALE),)

I guess that should have been BR2_ENABLE_LOCALE. UCLIBC_HAS_LOCALE is 
from the uClibc config file.

CU
Uli
