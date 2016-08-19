From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:45:22 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.28.1
In-Reply-To: <57ADD094.9070102@imgtec.com>
References: <1470938996-10477-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160811223549.50c52467@free-electrons.com>
 <57ADD094.9070102@imgtec.com>
Message-ID: <20160819234522.76880b68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Aug 2016 19:05:16 +0530, Rahul Bedarkar wrote:

> It is about supporting uuidd in libuuid even if uuidd daemon is disabled.
> 
> https://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=3e584e8576aef83f934e8409d07758550dd019cb
> 
> I'm not even sure about it's functionality but based on help that is 
> available for this config option, I've added it.

At this point, within the context of Buildroot, I don't really see the
need for this new option, so I've applied your patch to next after
removing this new option. We'll see if someone needs it in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
