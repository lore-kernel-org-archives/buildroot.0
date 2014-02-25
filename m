From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:30:26 +0100
Subject: [Buildroot] [PATCH v2 2/2] manual: add virtual package tutorial.
In-Reply-To: <1393343137-4209-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140225223023.GC3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-25 16:45 +0100, Eric Le Bihan spake thusly:
> The manual now features a new section with instructions about how to add a
> virtual package.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Same comment as Samuel.

Otherwise, I agree with Arnout: we will soon have a virtual-package
infrastructure (see my recent RFC series), and virtual packages are not
something we expect to be added very often.

I know I pushed you to repost an updated version of that patch, so we
could get it in for 2014.02, but in restrospect, Arnout is right: we can
well wait post-release to aply it. My apologies.

Anyway, this patch is rather good, and will need only minor changes (ie.
removals) to the .mk section once we have the virtual-package infra.

Thank you for your work on this! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
