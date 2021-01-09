From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 12:16:15 +0100
Subject: [Buildroot] [PATCH 06/10 v3] WIP: support/testing: update
 git-hash checks with new archive format
In-Reply-To: <a415b775-ca0e-45b5-aaa7-5d728604050b@mind.be>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <74928f23343a32a47253eb2bedceb717ddb874b4.1609239666.git.yann.morin.1998@free.fr>
 <a415b775-ca0e-45b5-aaa7-5d728604050b@mind.be>
Message-ID: <20210109111615.GQ1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-01-05 23:32 +0100, Arnout Vandecappelle spake thusly:
> On 29/12/2020 12:01, Yann E. MORIN wrote:
> > ** WIP: should be squashed into the commit that changes the git backend.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Vincent Fazio <vfazio@xes-inc.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Note that you can do `git commit --squash` to generate a message that
> automatically squashes with the previous ones when you do rebase -i. Or better
> yet, --fixup, then the commit message is dropped entirely.

Thanks, I knew that; I even use it extensively. ;-)

However, I do have my ~/.gitconfig set to rebase.autosquash=yes, but I
do *not* want the WIP commits in that series to auto-squash when I
rebase! Not as long as the series is not ready, that is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
