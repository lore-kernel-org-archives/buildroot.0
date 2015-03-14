From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 17:05:30 +0100
Subject: [Buildroot] [PATCH v3 1/1] fftw: add compile precision option
In-Reply-To: <1426346992-24724-1-git-send-email-gwenj@trabucayre.com>
References: <1426346992-24724-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150314170530.0ffab0af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sat, 14 Mar 2015 16:29:52 +0100, Gwenhael Goavec-Merou wrote:

> Changes v2 -> v3:
>  * add depends instruction for quad-precision. This option needs to have a
>    toolchain with libquadmath enabled (only x86, x86_64 and Itanium).

What did you do to fix long double precision? It also wasn't building,
see my review of your PATCH v2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
