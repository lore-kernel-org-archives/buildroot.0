From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 15:09:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: add libunwind optional
 dependency
In-Reply-To: <20170416194906.9842-1-romain.naour@gmail.com>
References: <20170416194906.9842-1-romain.naour@gmail.com>
Message-ID: <20170417150919.529e0dda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 21:49:05 +0200, Romain Naour wrote:
> There is no configure option to enable/disable libunwind support.
> See efl/m4/efl_libunwind.m4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/efl.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
