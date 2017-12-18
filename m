From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:01:27 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable features and add
 optional dependencies
In-Reply-To: <20171218095143.15343-1-mlang@blind.guru>
References: <20171218095143.15343-1-mlang@blind.guru>
Message-ID: <20171218110127.6df4ba7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this fixup patch. A few comments/questions below.

On Mon, 18 Dec 2017 10:51:43 +0100, Mario Lang wrote:
> * --without-midi-package should fix a number of autobuild failures.

Which ones? We like to have references to autobuilder failures.

> * Disable a number of speech drivers to avoid build failures
>   if they are installed on the host.
> * Optional dependency on espeak and flite fixes builds where
>   espeak or flite are installed on the host.

Autobuilder failure references ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
