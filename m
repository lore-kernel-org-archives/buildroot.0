From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 08:27:20 +0200
Subject: [Buildroot] [PATCH] packages: autoreconf non-vanilla libtool
 packages
In-Reply-To: <1406775740-20477-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406775740-20477-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140731082720.116b7b46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 31 Jul 2014 00:02:20 -0300, Gustavo Zacarias wrote:
> Some packages no longer apply the libtool patch since commit
> 97703978ac870ce2b14ad144f8e082de82aa2c64 because they use a non-vanilla
> version of libtool 1.5.x
> 
> Fixes many failures like:
> http://autobuild.buildroot.net/results/34e/34e4898e2bdc08e5d34e16e556384b3086b76467/
> http://autobuild.buildroot.net/results/ecf/ecf4e7d6812f972d05c95203fb665235856c0817/
> http://autobuild.buildroot.net/results/5d9/5d9a05fb70e8a65f2399c4f38375aeafb9686ea4/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Ok. Even though I'm not entirely happy about this solution, it seems to
be the easiest one, and since we need to move forward, I've applied it
for now.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
