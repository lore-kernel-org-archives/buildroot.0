From: Gustavo Heinz <gustavo@gsthnz.com>
Date: Tue, 27 Oct 2020 09:16:17 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-26
Message-ID: <13300abd-7ceb-424e-e7a1-666f705e6b24@gsthnz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/27/20 5:12 AM, Thomas Petazzoni wrote:

> Build failures related to your packages:
> 
>      arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   powerpc64   |     python-m2crypto-0.36.0     | http://autobuild.buildroot.net/results/87a02d73b31bd5972548c91a828af10bcb9638b8
>      arm      |     python-m2crypto-0.36.0     | http://autobuild.buildroot.net/results/85f11b65d0ff889f0219b1a1d3bba13c1d6fef1c
>   powerpc64   |     python-m2crypto-0.36.0     | http://autobuild.buildroot.net/results/37f8a32e4db188cb684542fcb7afef0ede8a9f32
>    riscv64    |     python-m2crypto-0.36.0     | http://autobuild.buildroot.net/results/70a1687f8cfe5b145d53ae98a4fa220d085ae2a3
>      arm      |     python-m2crypto-0.36.0     | http://autobuild.buildroot.net/results/6eee206382969c7b288c8756f3a41557470204ba
> 

I'm trying to fix this error, it seems to be happening a lot on the 
autobuild.

However I'm not sure what seems to be the problem here, if I run from 
the provided config I can reproduce the problem, but if I remove the 
external toolchain and use the toolchain from buildroot with the same 
arch, the problem does not happen.

Am I missing something here?

-- 
Gustavo Heinz
