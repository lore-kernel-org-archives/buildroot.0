From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:15:04 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: bump to version 9.10.2
In-Reply-To: <1435835927-54824-1-git-send-email-kaszak@gmail.com>
References: <1435835927-54824-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150704141504.1d09862b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Thu,  2 Jul 2015 13:18:47 +0200, Karoly Kasza wrote:
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
> Change: Somehow the configure script lost it's execution permission.
> Needed to add a hook for chmod to be able to execute it.

Applied, thanks. If you could report upstream the execution permission
bug, it would be good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
