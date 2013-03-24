From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:51:06 +0100
Subject: [Buildroot] [PATCH] dosfstools: fix host variant dependencies
In-Reply-To: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
References: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130324095106.103e7414@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 21 Mar 2013 09:12:34 -0300, Gustavo Zacarias wrote:
> host-dosfstools shouldn't pull host-libiconv in since that's for
> uClibc-based toolchains and we don't have that package anyway.
> Fixes:
> http://autobuild.buildroot.net/results/7637985bfb0afdd9217c297e9b0ac5de797c137d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
