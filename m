From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 16:07:43 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
 MIPS64/n32
In-Reply-To: <CAG2jQ8ij_NnerC79h_NL4EpS9Sawv1EszOQp-iZW2W38nkeV6w@mail.gmail.com>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
 <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
 <20130711125908.55bcb3b3@skate>
 <CAG2jQ8ikuHv=zgoRN3Y6pyyGo8E49taW6M1ZMfbv6+xQ8r58cg@mail.gmail.com>
 <CAAXf6LVN60LcoCDooO8N7wj_N-CRASJbofxk_LDi1qEdkXuaMA@mail.gmail.com>
 <CAG2jQ8iHKiuRCGvMPOpgqmXdAuYgzJP6C4+CGq=dUz6p6JMTJw@mail.gmail.com>
 <20130711154018.3ee37e86@skate>
 <CAG2jQ8ij_NnerC79h_NL4EpS9Sawv1EszOQp-iZW2W38nkeV6w@mail.gmail.com>
Message-ID: <20130711160743.78f8b824@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Thu, 11 Jul 2013 15:00:24 +0100, Markos Chandras wrote:

> I presume it's needed for every uClibc based toolchain. It's
> definitely needed by the buildroot toolchain which is the one I use.

But didn't you had gcc patches to make it use the correct patch for the
program interpreter? But yeah, for external toolchains, it's not
possible.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
