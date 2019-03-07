From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 23:00:56 +0100
Subject: [Buildroot] [PATCH 2/3] board/qemu/xtensa-lx60: backport
 upsteam patch fixing kernel runtime issue with Binutils 2.32.
In-Reply-To: <20190204223010.19733-2-romain.naour@gmail.com>
References: <20190204223010.19733-1-romain.naour@gmail.com>
 <20190204223010.19733-2-romain.naour@gmail.com>
Message-ID: <d02af7b1-6515-bdbd-12a5-e2bc6138961b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/02/2019 23:30, Romain Naour wrote:
> With Binutils 2.32, xtensa kernel <= 4.18 need an upstream patch from kernel 4.19 [1]

 Since Gerome bumped this and the other defconfigs to 4.19.16, I guess this one
is no longer valid. So I've marked it as Superseded.

 Regards,
 Arnout

> 
> [1] https://www.sourceware.org/ml/binutils/2019-02/msg00015.html
> 
> Fixes:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/155355484
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
