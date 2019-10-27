From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 15:20:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/strace: add patch for nds32
 support
In-Reply-To: <20190507013355.14062-1-nylon7@andestech.com>
References: <20190507013355.14062-1-nylon7@andestech.com>
Message-ID: <20191027152028.0726fb64@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for the very slow feedback.

On Tue, 7 May 2019 09:33:55 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Fixes:
>   http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
>   http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb

It clearly doesn't fix those build issues, because strace is not
available on BR2_nds32.

>  package/strace/0001-Add-nds32-porting.patch | 491 ++++++++++++++++++++

This is a fairly large patch, and it still hasn't been contributed to
strace upstream. I'm not talking about it been merged, but at least
being submitted: I don't see any submission of nds32 support on the
strace mailing list, and no pull request.

Could you submit it upstream, and then resubmit your patch, with a
reference to the upstream submission ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
