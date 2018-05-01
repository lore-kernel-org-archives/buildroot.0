From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:54:32 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: force -fno-stack-protector in
 CPPFLAGS
In-Reply-To: <20180419083659.22462-2-tarek_el-sherbiny@waters.com> (tarek
 el-sherbiny's message of "Thu, 19 Apr 2018 09:36:59 +0100")
References: <20180419083659.22462-1-tarek_el-sherbiny@waters.com>
 <20180419083659.22462-2-tarek_el-sherbiny@waters.com>
Message-ID: <87sh7bn9w7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "tarek" == tarek el-sherbiny <tarek_el-sherbiny@waters.com> writes:

 > From: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>
 > The last commit which implements this workaround is now broken by
 > commit 20a4583ebf7fe97ea22a1ea11621dd44a8114ca5
 > This commit will force no-stack-protector in CPPFLAGS instead of
 > CFLAGS to work with buildroot 2018_02

 > Signed-off-by: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
