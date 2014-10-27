From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 13:41:37 +0100
Subject: [Buildroot] [PATCH 1/1] libgtk3: fix undefined reference to
 get_xkb()
In-Reply-To: <1414407782-9324-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414407782-9324-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141027134137.7a9d83fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 27 Oct 2014 12:03:02 +0100, Eric Le Bihan wrote:
> When configuring Gtk+ with --disable-xkb, the build fails because of an
> undefined reference to get_xkb().
> 
> This issue as been reported upstream [1]. This patch fixes it.
> 
> Fixes: 513d79b97bb8ad0e5cd431c47c706b5ec87a9882
> Fixes: 0c3f1df92481852622445478d2239371fc818f41

Are these commit IDs, or autobuilder result IDs? If the latter, then
it should be full URL to the autobuilder result.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
