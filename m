From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Sun, 18 Oct 2015 08:59:50 -0300
Subject: [Buildroot] [PATCH] webkitgtk24: add patch to disable
 dependency tracking
In-Reply-To: <20151017165645.GE3717@free.fr>
References: <1445010543-26875-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20151017165645.GE3717@free.fr>
Message-ID: <562389B6.50405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/15 13:56, Yann E. MORIN wrote:

> Is that patch upstream?
>
> If it is, please add a pointer to the upstream commit.
>
> If not, then I'd prefer we do not carry that. Gaining 2 minutes over 42
> is just below 5%, so I am not persuaded this is worth it.
>
> Regards,
> Yann E. MORIN.

Hi Yann.
According to the tracker it is, however it still applies which makes it odd.
Anyway it doesn't solve the problem for all build combinations hence 
i've marked it as rejected in patchwork already (x86_64 with jit fails).
The time savings are so small that it probably doesn't make much sense, 
also 2.6.x+ switched to cmake making this irrelevant, and i've got a 
2.10.x bump in the works.
Regards.
