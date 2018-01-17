From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:24:03 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <20180117232403.7bfb408f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jan 2018 21:19:42 +0100, tolvupostur at gmail.com wrote:
> From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> 
> The iputils executables are installed without the setuid bit set,
> which prevents some programs from working.
> 
> This patch adds a post-install hook to fix the permissions of the
> ping and traceroute6 executables.

You didn't add a post-install hook, but a permission table.

I've applied after adjusting the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
