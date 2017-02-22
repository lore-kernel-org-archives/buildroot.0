From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 14:44:13 +0100
Subject: [Buildroot] [PATCH 1/2 next] Revert "reproducible: fix
 DATE/TIME macros in toolchain-wrapper"
In-Reply-To: <6881dd6c-140a-9cb3-a948-8cb7d0a4a8a4@mind.be>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
 <20170221214750.4c057f08@free-electrons.com>
 <20170221205435.GA3347@free.fr>
 <20170221220121.049d38a6@free-electrons.com>
 <6881dd6c-140a-9cb3-a948-8cb7d0a4a8a4@mind.be>
Message-ID: <20170222144413.4f1c3e51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 12:50:36 +0100, Arnout Vandecappelle wrote:

>  Is there any reason not to regularly merge master into next?

Because there's usually not reason to do so, and this patch is also not
a very good reason to do so. There's still plenty of things to fix in
master, and master is really the focus. The release is only in 6 days,
so it's not a lot of time to wait to have next merged back into master
and the new development cycle opened.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
