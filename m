From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 14:46:24 +0100
Subject: [Buildroot] [PATCH 05/10 v3] WIP: boot+packages: update hash to
 new git-tarballs format
In-Reply-To: <b976af57-7237-cd64-c57b-b83d32dcaa36@mind.be>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <29b653935ed3ec38f7e0bb05445be7e99473aa5d.1609239666.git.yann.morin.1998@free.fr>
 <b976af57-7237-cd64-c57b-b83d32dcaa36@mind.be>
Message-ID: <20210109134624.GT1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-01-05 23:30 +0100, Arnout Vandecappelle spake thusly:
> On 29/12/2020 12:01, Yann E. MORIN wrote:
> > ** WIP: should be squashed with the commit that updates the git backend
> > 
> > Of all the bootloaders that have a git download method, vexpress-firmware
> > is the only one to have a hash. Others have no hash files, or they have
> > explicitly set BR_NO_CHECK_HASH_FOR.
> > 
> > For the packages, linux-headers is the special snowflake, as the git
> > download is only for custom git tree, so it is excluded from the hash
> > verification with BR_NO_CHECK_HASH_FOR.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Vincent Fazio <vfazio@xes-inc.com>
> 
>  Did you use a script to (partially) generate this? If yes, it would be nice to
> include it in the commit message.

Yeah, you know me all too well. I'll include the script in the commit
log.

> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  I've only visually inspected this, I haven't checked if there are any packages
> that were missed. But as discussed orally: the autobuilders will catch those.

Yup.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
