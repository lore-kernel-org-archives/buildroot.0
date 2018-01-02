From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:39:49 +0100
Subject: [Buildroot] [PATCH v4 1/1] tcfagent: new package
In-Reply-To: <20180102173925.3945-1-nolange79@gmail.com>
References: <20180102173925.3945-1-nolange79@gmail.com>
Message-ID: <20180102223949.74b34109@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 18:39:25 +0100, Norbert Lange wrote:
> Add tcfpackage which contains a service "tcf-agent"
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Thanks, I've applied after doing the following changes:

 - I've renamed the package to tcf-agent (instead of tcfagent). Indeed,
   the name of the project is tcf.agent, and the name of the daemon is
   tcf-agent, so it made sense to use tcf-agent.

 - I've added a dependency on BR2_USE_MMU, because the package selects
   BR2_PACKAGE_UTIL_LINUX_LIBUUID, so it must inherit that dependency.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
