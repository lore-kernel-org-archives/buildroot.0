From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Oct 2010 11:19:43 +0200
Subject: [Buildroot] [PATCH 06/10] microperl: convert to gentargets
In-Reply-To: <1286266963-23413-6-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-6-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101005111943.7ed624fa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Oct 2010 01:22:39 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> +define MICROPERL_CONFIGURE_CMDS

I am not a huge huge fan of this, because it's subverting the purpose
of MICROPERL_CONFIGURE_CMDS to do a more-or-less partial build of
microperl for the host. Do we really need such a partial build ? If so,
shouldn't we create a host-microperl package ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
