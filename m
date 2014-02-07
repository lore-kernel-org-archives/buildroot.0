From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 14:32:05 +0100
Subject: [Buildroot] [PATCH v11 2/8] package: add toolchain dependency
 to every target package
In-Reply-To: <CAHkwnC-9nzZE1_w95wr_LuCWfyaTgie-P1=Gu0jHH69TKx0umA@mail.gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
 <CAHkwnC-9nzZE1_w95wr_LuCWfyaTgie-P1=Gu0jHH69TKx0umA@mail.gmail.com>
Message-ID: <20140207143205.0dba98e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Feb 2014 13:57:24 +0100, Fabio Porcedda wrote:

> This line should be changed to:
> 
> ifeq ($(4),target)
> 
> After the recently merged commit 26aef889f1df32d5a15cd70f6b1e316ebb830cb7
> (infra: remove unused 4th parameter to package infrastructures (pkgparentdir))
> the $(4) must be used instead of $(5).
> 
> Do you prefer that i send a fixed patch series or  i send a new commit
> to fix that?
> Which solution do you prefer?
> If you prefer i can send a new version today.
> I just don't want to delay anymore the merge of this patch series.

I'd say: wait for 2014.02-rc1 to be released, and send a new version.
This way, Peter can apply it to the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
