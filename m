From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:45:43 +0100
Subject: [Buildroot] [PATCH v2 1/1] automake: fix unescaped left brace
 warning patch.
In-Reply-To: <20170306132359.21768-1-aduskett@codeblue.com>
References: <20170306132359.21768-1-aduskett@codeblue.com>
Message-ID: <20170320214543.02c3461c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 08:23:59 -0500, Adam Duskett wrote:
> Automake currently has a unescaped left brace in it's automake.in folder
> that generates the warning:
> "Unescaped left brace in regex is deprecated, passed through in regex;"
> This patch, which is backported from upstream fixes this warning.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

I've applied. However, you should format the patches of projects
managed with Git using "git format-patch". So the automake patch should
have been Git formatted. I've fixed that before applying.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
