From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 15:22:47 +0200
Subject: [Buildroot] [PATCH 1/3] Change elf2flt upstream repository
In-Reply-To: <1441470751-22909-1-git-send-email-public.douglas.raillard@gmail.com>
References: <1441470751-22909-1-git-send-email-public.douglas.raillard@gmail.com>
Message-ID: <20150906152247.001abba0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Douglas RAILLARD,

On Sat,  5 Sep 2015 18:32:31 +0200, Douglas RAILLARD wrote:
> Use Waldemar Brodkorb's repository (at least) until an
> "official" upstream repository is established, to get
> the ARM noMMU patches
> 
> Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>

This looks good, the only minor nit is that the title should be:

	elf2flt: change upstream repository

I.e, we like when commits all follow a commit title like:

	<package>: <description>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
