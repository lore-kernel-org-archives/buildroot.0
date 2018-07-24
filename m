From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Jul 2018 08:37:45 +0200
Subject: [Buildroot] [PATCH 1/1] Adding support to conditionally build
 the GNAT Ada compiler in the toolchain.
In-Reply-To: <CF02927B-5016-479E-8EBD-CA7D03809825@gmail.com>
References: <20180521013248.22532-1-glen.m.cornell@gmail.com>
 <20180521102905.00f0a365@windsurf>
 <51E2F87E-1703-4DE0-BAFA-4FFA1AA0CFC9@gmail.com>
 <20180523103210.50c7ac38@windsurf>
 <CF02927B-5016-479E-8EBD-CA7D03809825@gmail.com>
Message-ID: <20180724083745.3cde0ec9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jul 2018 21:52:34 -0400, Glen Cornell wrote:

> Hi Thomas.  I didn?t want to leave you hanging on this.  I did some
> research on this.  It appears that the version of the gnat cross
> compiler is dependent upon the version of the host gnat compiler.
> It?s something that would break most build environments where the two
> versions differ.  

OK. This could be resolved by building our own gcc/gnat native
compiler. It's a bit of effort obviously, but it could be done.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
