From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jan 2018 18:36:03 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <d7a33501-8fb4-4524-685f-8c3c16fd73e4@smile.fr>
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
 <20180111171357.GA3559@scaer>
 <20180112095938.621ff1bc@windsurf.lan>
 <d7a33501-8fb4-4524-685f-8c3c16fd73e4@smile.fr>
Message-ID: <20180112173603.GB3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-12 10:06 +0100, Romain Naour spake thusly:
> Le 12/01/2018 ? 09:59, Thomas Petazzoni a ?crit?:
> > On Thu, 11 Jan 2018 18:13:57 +0100, Yann E. MORIN wrote:
> >> I would do:
> >>     grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \
> Ok, I'll fix this.
> But the same issue should happen with other shell (not tested though).

You are fixing bash with thispatch. Other patches could fix the other
shells. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
