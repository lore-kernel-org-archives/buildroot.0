From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Oct 2013 19:59:51 -0300
Subject: [Buildroot] [PATCH] xdriver_xf86-video-geode: only build on i386
In-Reply-To: <1382655055-3520-1-git-send-email-arnout@mind.be>
References: <1382655055-3520-1-git-send-email-arnout@mind.be>
Message-ID: <5269A667.8050800@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/24/2013 07:50 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> This package builds with -m32. In buildroot, we don't have multilib
> support so only the 64-bit libraries are available, which can't be
> linked against these 32-bit object files.
> 
> I've tested this with the Sourcery and buildroot toolchains - neither
> works.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(The geode is NSC's old embedded x86 chip with on-chip video so no
64-bit variant and no standalone cards).
