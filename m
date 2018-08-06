From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Aug 2018 00:14:38 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <d1cdffd986d2f2128396aa785d542fdd3d2c90e0.1533400367.git.yann.morin.1998@free.fr>
Message-ID: <5b67bd1e9b36b_78eb3f98000819849635@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 04, 2018 at 01:33 PM, Yann E. MORIN wrote:

[snip]
> +# Check if the changeset is a branch name.
> +if _git show-ref "${cset}" |grep -qv refs/tags; then

I didn't had time to test it yet.
Special refs still works after this?

Regards,
Ricardo
