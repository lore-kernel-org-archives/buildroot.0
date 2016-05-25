From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 23:11:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: install in the same
 location as e2fsprogs
In-Reply-To: <1464096676-41655-1-git-send-email-ckhardin@exablox.com>
References: <1464096676-41655-1-git-send-email-ckhardin@exablox.com>
Message-ID: <20160525231110.648f963a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 May 2016 06:31:16 -0700, Charles Hardin wrote:
> The configure script hard codes "/sbin" for installation which
> installs the XFS tools in a different location then the e2fsprogs.
> 
> This is just a cosmetic patch so all the tools end up in "/usr/sbin"
> for consistency.
> 
> Signed-off-by: Charles Hardin <ckhardin@exablox.com>

What is the motivation for this change? If the upstream xfsprogs
developers think it should be installed in /sbin, why should we change
it?

In any case, the patch itself needs a description + your Signed-off-by
line. Also, it should be submitted to the upstream xfsprogs developers
to see if they might accept it. Otherwise I think we would prefer to
keep the existing behavior.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
