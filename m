From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:04:34 +0100
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170218113202.14213-3-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
Message-ID: <20170220220434.728a8a89@free-electrons.com>
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

From this description, it is not clear whether this is material for
master or for next. What happens currently with Harfbuzz? Qt is always
using its internal version?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
