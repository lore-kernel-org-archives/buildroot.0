From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2013 21:28:33 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	graph-depends-improvements
In-Reply-To: <201301022121.42142.yann.morin.1998@free.fr>
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
 <201301022121.42142.yann.morin.1998@free.fr>
Message-ID: <201301022128.33543.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 02 January 2013 Yann E. MORIN wrote:
> >  * Drastic optimization of the execution speed: on a given
> >    configuration, it used to take 5 minutes 14 seconds to generate the
> >    graph, now it takes 33 seconds.
> 
> It is indeed much faster now, but is broken here (with the attached
> defconfig):
[--SNIP--]
>     Error getting dependencies [...
>     'target-root-passwd'

This should go in the exclusion list. I'll cook a patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
