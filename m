From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:26:58 +0100
Subject: [Buildroot] [PATCH] cups: deprecate package due to security
 issues
In-Reply-To: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150316222658.607f3105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  6 Mar 2015 10:39:24 -0300, Gustavo Zacarias wrote:
> Also mark packages that depend on cups as deprecated as well for easier
> tracking.
> 
> It would probably be better to mark it as a legacy option so users get a
> warning when migrating configuration files, but it would require a
> direct removal for that.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
