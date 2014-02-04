From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 14:40:27 +0100
Subject: [Buildroot] [PATCH v2 1/1] icu: detect and add compiler symbol
 prefix to the assembly code
In-Reply-To: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20140204144027.39148ffb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Tue,  4 Feb 2014 14:06:46 +0100, Ryan Barnett wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Some compiler, such as Blackfin GNU compiler, prefix a charater to any

charater -> character

> C symbol in generated assembly code. If any assembly symbol is invoked
> from C code, it needs to be prefixed as well.
> 
> Note: since autoreconf doesn't work with this package because automake
> isn't support

"isn't support" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
