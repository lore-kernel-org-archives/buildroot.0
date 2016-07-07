From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 21:32:40 +0200
Subject: [Buildroot] [PATCH] tekui: relax dynamic library dependency
In-Reply-To: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
References: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160707213240.378baea9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 19:01:30 +0200, Francois Perrad wrote:
> tekui doesn't really require these Lua modules.
> These modules are added because they increase the user experience with demo/examples.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Then perhaps there should be a sub-option to enable the demo/examples?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
