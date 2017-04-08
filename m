From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:09:59 +0200
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170218113202.14213-3-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
Message-ID: <20170408160959.1e0ef627@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 12:32:02 +0100, Peter Seiderer wrote:
> If selected use:
> 
>  - system/buildroot harfbuzz in case __sync for 4 bytes is supported
>  - qt harfbuzz otherwise (using QAtomic instead)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

We still have this patch pending. Could you summarize if it's still
needed. From a quick read of our past discussion, it seems like it is
still needed, but I prefer to ask before applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
