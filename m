From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 22 Aug 2013 21:46:49 +0100
Subject: [Buildroot] [PATCH] toolchain-external: fix lib64 symlinks
In-Reply-To: <521674C1.7090304@mind.be>
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
 <CAG2jQ8iVYt=QK9s4sKKzbCsRvp=rA4_BjPSg0DnTQtOobOtn4A@mail.gmail.com>
 <521674C1.7090304@mind.be>
Message-ID: <CAG2jQ8jnSryQR8iQW-OPGN0RYKh1QLjYA9sgGKc7eLnpwYkA7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 August 2013 21:29, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> [...]
> Or does MIPS64/n32 need both lib32 and lib64?
>

Hi Arnout,

No, MIPS64/n32 only needs lib32 as far as I can tell.

-- 
Regards,
Markos Chandras
