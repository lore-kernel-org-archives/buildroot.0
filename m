From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:33:03 +0100
Subject: [Buildroot] [PATCH v2] package/ntp: override host shell check
In-Reply-To: <0102016ea77c74a6-7525be73-3836-4c75-ae25-c9197a85b768-000000@eu-west-1.amazonses.com>
References: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
 <0102016ea77c74a6-7525be73-3836-4c75-ae25-c9197a85b768-000000@eu-west-1.amazonses.com>
Message-ID: <20191224153303.5bd1d49e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 11:33:01 +0000
James Byrne <james.byrne@origamienergy.com> wrote:

> Add a patch from the upstream AutoGen package that allows POSIX_SHELL to
> be taken from the environment, then define that to be '/bin/sh'.
> 
> Since we are cross-compiling, the original behaviour of detecting the
> host shell is not useful as we cannot assume that the target uses the
> same shell, and it can prevent builds being reproducible because a
> different host environment will result in a different target binary.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> 
> ---
> Changes v1 -> v2:
>   - Simplify by using upstream AutoGen change

Applied to master, thanks. Could you talk with the upstream NTP
developers to get this change merged ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
