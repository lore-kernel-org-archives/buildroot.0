From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 14:57:32 +0200
Subject: [Buildroot] [PATCH 01/24 v4] arch: add an option to specify if
 the	arch has atomic ops
In-Reply-To: <bd3543da-f3d3-4236-be5a-d6c85e8305ce@email.android.com>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <7d72fe60f396407b4fbc68ba8f9910cda0fe24a8.1408279142.git.yann.morin.1998@free.fr>
 <bd3543da-f3d3-4236-be5a-d6c85e8305ce@email.android.com>
Message-ID: <20140817145732.71eafc75@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 17 Aug 2014 14:55:06 +0200, Thomas De Schampheleire wrote:

> Is there a specific reason why the option is now
>  dubbed ATOMICS iso ATOMIC_INTRINSICS?
> 
> The latter may be a bit more descriptive, no?

But wouldn't make sense. "intrinsics" is a compiler notion, which
doesn't have much to do with an architecture. An architecture provides
atomic instructions, which in turn allow compilers to implement a
certain class of compiler intrinsics to access those atomic operations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
