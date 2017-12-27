From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 21:34:27 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <20171227145003.1669-1-stefan.froberg@petroprogram.com>
References: <20171227145003.1669-1-stefan.froberg@petroprogram.com>
Message-ID: <20171227213427.641ba6a3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 16:50:03 +0200, Stefan Fr?berg wrote:
> With this option GCC will make PIE binaries by default. To override this
> default behaviour, use -no-pie
> 
> https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/Link-Options.html
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Here as well, I'd like the commit log (and Config.in help text) to
include some explanations as to *why* one would want to do this.

Also, wouldn't we instead want a more global option that would also
work with external toolchains, where the compiler wrapper passes the
right gcc arguments ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
