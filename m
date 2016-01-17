From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jan 2016 12:23:40 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+-urNTGae35+MuvCzE3UE0POL0NJxfGRciXaZf8ohDdq_a-RQ@mail.gmail.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <CA+-urNTGae35+MuvCzE3UE0POL0NJxfGRciXaZf8ohDdq_a-RQ@mail.gmail.com>
Message-ID: <20160117122340.3b07b5ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jan 2016 20:42:55 -0500, Frank Hunleth wrote:

> > Frank, can you investigate why it builds on x86_64 but not on aarch64 ?
> 
> I looked into this a little. My suspicion is that the atomic intrinsic
> macros in the Erlang code have not been ported to aarch64, but I'm
> having trouble following the code. I've inquired on the Erlang mailing
> list and will report back.

Excellent, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
