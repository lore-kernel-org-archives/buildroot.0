From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:30:44 +0100
Subject: [Buildroot] gcc on target system issue
In-Reply-To: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
References: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
Message-ID: <20121116183044.6dcfc297@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Khryukin,

On Fri, 16 Nov 2012 01:20:32 +0300, Alexander Khryukin wrote:

> I'm trying to build gcc on target but it fails with

Why are you trying to build gcc on target? What is the purpose of
getting gcc on the target when building a small embedded Linux system
with Buildroot?

Notice that as per the decisions taken during the last Buildroot
Developers Meeting, the possibility of building gcc for the target in
Buildroot should soon be deprecated. So there is not a strong interest
to fix problems reported by users.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
