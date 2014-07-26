From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 26 Jul 2014 14:15:06 -0400
Subject: [Buildroot] Linaro toolchains no good for ARM softfp?
Message-ID: <CANxTyt4MwgdRLP7m_Vt_S78kgdbvqOqU07cVfU=UtnFgTaS7Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Back in buildroot-2013.xx, I was able to select the Linaro toolchains
for my ARM Cortex-A8 processor with softfp (just for experiment
against a modern toolchain, not really for everyday use in my
projects).  But now, the Linaro toolchains are only allowed if the
ABIhf option is set.  When I google around, I get to places like
https://wiki.linaro.org/WorkingGroups/ToolChain/FAQ#Does_Linaro_GCC_toolchain_support_Cortex-A7_along_with_NEONv2_.26_VFPv4.3F
which make me think that Linaro is not limited to hard fp.  Not so?

Danomi -
