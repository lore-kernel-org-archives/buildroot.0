From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 23:30:08 +0200
Subject: [Buildroot] [git commit] package/python-rtslib-fb: bump version
 to 2.1.58
In-Reply-To: <20161007231043.39e1d100@trantor>
References: <20161007131551.D7C9680089@busybox.osuosl.org>
 <20161007181627.7ff94cb3@trantor>
 <20161007222619.1a5f7701@free-electrons.com>
 <20161007231043.39e1d100@trantor>
Message-ID: <20161007233008.391cde28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 23:10:43 +0200, Christophe Vu-Brugier wrote:

> > Buildroot's policy is to follow what upstream decides... even if you
> > don't like it :)  
> 
> I understand Buildroot's policy.
> 
> The new dependencies are required by new features (user backstores rely
> on dbus) or brought to improve the code and its stability (pyudev). I
> am perfectly OK with this focus on features and stability.
> 
> And as the same time, as a buildroot user, I like when my rootfs is
> small :) Let's call this "Embedded Schizophrenia".

Well, nothing prevents you from complaining to the upstream developers,
and ask them to make those new dependencies optional.

> Sorry, I was not clear. I think it would be better to revert Bernd's
> patch. I can cook up patches to:
> 
>  * clarify that rtslib-fb should be fetched from GitHub instead of PyPI
>  * clarify that rtslib-fb, configshell-fb and targetcli-fb should be
>    kept in sync.
>  * later upgrade the three packages.
> 
> Would that be OK for Bernd and you?

Makes sense to me. I'll revert Bernd's patch.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
