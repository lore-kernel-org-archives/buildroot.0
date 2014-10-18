From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:23:52 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init
 scripts
In-Reply-To: <CAGduivxamBowj_0TCFZ-SEGd+x7FUM1JcsUhnRxFy_DuM1aWOQ@mail.gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
 <20141018185601.1a8e732c@free-electrons.com>
 <CAGduivwJMVzpd+uc6Ng_CMivXP1i3pNBtFVjd0ara70oZ5UKYA@mail.gmail.com>
 <20141018190628.67c1516c@free-electrons.com>
 <CAGduivxamBowj_0TCFZ-SEGd+x7FUM1JcsUhnRxFy_DuM1aWOQ@mail.gmail.com>
Message-ID: <20141018192352.77ead261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 19:11:37 +0200, Maxime Hadjinlian wrote:

> > Well, we could by default install S* and K* files, except if the
> > <pkg>_INIT_SYSV_FILES variable is defined, in which case we only
> > install the ones that are mentioned. Maybe it's making the logic too
> > complicated, I don't know.
> We could that, but as you say, maybe it makes things a little more
> complex than they should be.

Yeah, maybe you're right. What I'm proposing is too complicated, and
what you suggest has the advantage of being completely explicit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
