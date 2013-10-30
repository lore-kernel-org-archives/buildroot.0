From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:46:42 +0100
Subject: [Buildroot] [PATCH] cjson: link with libm,
 unavailable for static
In-Reply-To: <1383159811-16038-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383159811-16038-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131030224642.09feff1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Oct 2013 16:03:31 -0300, Gustavo Zacarias wrote:
> Link with libm as stated in the README, fixes:
> http://autobuild.buildroot.net/results/57f/57fc124e14263ee2447e20a5b910ed3ae0a5b7db/
> 
> Also disable the package for static builds since it doesn't work that
> way.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
