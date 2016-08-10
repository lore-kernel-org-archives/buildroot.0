From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 12:25:09 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.9
In-Reply-To: <1470796264-19662-1-git-send-email-gustavo@zacarias.com.ar>
References: <1470796264-19662-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160810122509.5d6a83fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 23:31:04 -0300, Gustavo Zacarias wrote:
> Add upstream patch to fix build failure with gcc warnings on.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I think you told me yesterday this 4.9 bump was adding a security fix.
Is this the case? It's quite important, as it will decide if this patch
gets committed to master or next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
