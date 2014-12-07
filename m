From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:48:35 +0100
Subject: [Buildroot] [RFC PATCH 0/2] Add Freescale e5500 & e6500 support
In-Reply-To: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141207234835.4fac269f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 17 Nov 2014 20:14:50 -0300, Gustavo Zacarias wrote:

> Gustavo Zacarias (2):
>   arch/powerpc: add fsl e5500 and e6500 support
>   package/gcc: set e5500 and e6500 version mask

Patches applied. I must say I'm a bit confused by why we exclude PP64le
for those new platforms. Is there theoretically something that would
prevent those from being used in LE mode?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
