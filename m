From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Dec 2015 23:45:05 +0100
Subject: [Buildroot] [PATCH] gcc: bump 5.x series to version 5.3.0
In-Reply-To: <871tazryfx.fsf@dell.be.48ers.dk>
References: <1449428596-26365-1-git-send-email-gustavo@zacarias.com.ar>
 <871tazryfx.fsf@dell.be.48ers.dk>
Message-ID: <20151206224505.GF4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-12-06 23:42 +0100, Peter Korsgaard spake thusly:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  > 201-libgcc-remove-unistd-header.patch is upstream so remove it.
>  > Also remove host-cloog dependency since it's not required any more.
> 
>  > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> Committed, thanks.

Did you commit that as a single commit, or did you split the bumpt from
the host-cloog dependency removal?

IMHO, they are two different and unrelated changes, and should have been
two commits.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
