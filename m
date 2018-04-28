From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:04:43 +0200
Subject: [Buildroot] [PATCH v3] package/bash-completion: new package
In-Reply-To: <1524562102-24480-1-git-send-email-romain.naour@smile.fr>
References: <1524562102-24480-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180428180443.7de13a7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Apr 2018 11:28:22 +0200, Romain Naour wrote:
> From: Jeremy Rosen <jeremy.rosen@smile.fr>
> 
> Along with other files, bash_completion install bash_completion.sh
> script in /etc/profile.d to load bash_completion for interactive shell.
> 
> When interactive shells is used, /etc/profile is executed and source
> all *.sh script present in /etc/profile.d directoty.
> 
> If the system does not use the /etc/profile.d directory mechanism,
> the /etc/profile.d/bash_completion.sh script can be sourced in
> /etc/bashrc or ~/.bashrc.
> 
> bashrc file can be provided from a rootfs overlay when needed.

This whole explanation in the commit log didn't make much sense to me.
Rather than explaining what the patch does, it explains how to
integrate bash-completion into your system. So I've simplified this
explanation and moved it to the Config.in help text.

Applied with this change!

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
