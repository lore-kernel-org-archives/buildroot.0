From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2013 13:05:12 +0100
Subject: [Buildroot] [PATCH 1/1] nut: add libltdl dependency
In-Reply-To: <87fvqmm3x2.fsf@dell.be.48ers.dk>
References: <1385232385-8527-1-git-send-email-romain.naour@openwide.fr>
 <87fvqmm3x2.fsf@dell.be.48ers.dk>
Message-ID: <20131124120512.GA3575@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-11-24 12:31 +0100, Peter Korsgaard spake thusly:
> >>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
> 
>  > libltdl is needed for nut-scanner
>  > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Committed, thanks.
> 
> Do you think this fixes:
> 
> http://autobuild.buildroot.net/results/7e4/7e4e369dc5640619e95983ad0b4571f3a3f0d84b/build-end.log
> 
> Or is that another problem?

Neither Romain nor I were able to reproduce this build failure (without
Romain's chage, that is).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
