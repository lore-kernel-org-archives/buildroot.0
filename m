From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:43:12 +0100
Subject: [Buildroot] [PATCH] toolchain: add hashes for all remaining
 external toolchains
In-Reply-To: <1420128747-9101-1-git-send-email-yann.morin.1998@free.fr>
References: <1420128747-9101-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150107224312.63f3b1b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  1 Jan 2015 17:12:27 +0100, Yann E. MORIN wrote:
> Getting the hashes from upstream is not always possible:
>   - Mentor's Sourcery: seems to require an account
>   - TI's Arago: not able to locate the upstream.
>   - Linaro: only signatures
>   - Buildroot: Eh! ;-)

There were no "Buildroot" toolchains, only misc toolchains hosted on
the Buildroot site. So I've replaced this last line by "Misc
toolchains", and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
