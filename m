From: Erik Andersen <andersen@codepoet.org>
Date: Wed, 28 Feb 2007 14:45:34 -0700
Subject: [Buildroot] static libgcc_s
In-Reply-To: <45E5A4E6.3010508@indiana.edu>
References: <45E5A4E6.3010508@indiana.edu>
Message-ID: <20070228214534.GA23235@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed Feb 28, 2007 at 10:51:02AM -0500, Piotr Adam Zolnierczuk wrote:
> Any ideas how can I "force" buildroot to build a static version of libgcc_s?

disable BR2_GCC_SHARED_LIBGCC in your buildroot .config
and rebuild your toolchain.  No more shared libgcc_s...

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
