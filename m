From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:52:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/softether: Fix compilation error
In-Reply-To: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150315145203.401bacd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 10 Mar 2015 19:58:36 +0100, Bernd Kuhls wrote:
> /home/buildroot/instance-0/output/build/host-softether-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/Mayaqua/Unix.c:2066:
> undefined reference to `clock_gettime'
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Both patches applied.

For this specific patch, I've also reverted Peter's fix for the same
problem, since it was no longer needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
