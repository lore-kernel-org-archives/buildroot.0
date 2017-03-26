From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 21:41:39 +0200
Subject: [Buildroot] [PATCH 00/23] xtensa overlay application rework
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170326214139.57f3091c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 11:30:29 -0700, Max Filippov wrote:

>   core: include arch-specific definitions
>   arch/xtensa: add definitions for the Xtensa overlay
>   package/binutils: use the Xtensa variables
>   package/gdb: use the Xtensa variables
>   package/gcc: use the Xtensa variables
>   arch/xtensa: add macro to extract the overlay
>   package/binutils: use macro to extract Xtensa overlay
>   package/gdb: use macro to extract Xtensa overlay
>   package/gcc: use macro to extract Xtensa overlay
>   package/binutils: extract Xtensa overlay as post-extract hook
>   package/gdb: extract Xtensa overlay as post-extract hook

I've applied the first 11 patches of this series. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
