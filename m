From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:08:34 +0200
Subject: [Buildroot] [PATCH 1/3] fio: bump to version 2.13
In-Reply-To: <1469295036-21853-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469295036-21853-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723230834.6a4d303c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 14:30:34 -0300, Gustavo Zacarias wrote:
> And drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

All three applied. Note that we can add a hash file for Git-sourced
packages, since our retrieval logic from Git repositories creates
reproducible archives.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
