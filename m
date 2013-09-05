From: Michael Rommel <rommel@layer-7.net>
Date: Fri, 6 Sep 2013 00:03:16 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <20130905101359.3be9c385@skate>
References: <1378165788-7386-1-git-send-email-rommel@layer-7.net>
 <52276202.6010508@mind.be> <028035D9-F009-4D2C-B63E-6D6BFD08D5B7@layer-7.net>
 <20130905101359.3be9c385@skate>
Message-ID: <3353FB1E-65F9-4ED0-B945-90A8B1104691@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sep 5, 2013, at 10:13 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Between (1) and (3) I believe it's mainly a matter of whether you think
> your fixes to the Makefile can be integrated upstream into a new
> release or not. If your Makefile changes can be integrated upstream and
> a new release is made, we can update Buildroot to use this new release,
> drop the patch, and everything is nice. On the other hand, if the
> upstream is more or less dead (which the very old version number seems
> to indicate), then the chances of having the patch accepted and a new
> release published is rather small. In that case, doing a manual
> AICCU_INSTALL_TARGET_CMDS and AICCU_INSTALL_INIT_SYSV is probably
> better.

I opted for (3), I think the patch is cleaner now and since I have not heard 
anything back from upstream, I guess they are reluctant to put any effort in
this tool.


> Network is S40network. ntp is installed at S49ntp. So I guess something
>> = 50 should be fine.

done.

> You don't need to set explicit permissions if you use the
> AICCU_INSTALL_INIT_SYSV method since you do an $(INSTALL) -m 0755.


done.

Cheers,

  Michael.

-- 
Michael Rommel, Erlangen, Germany
