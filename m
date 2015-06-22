From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:28:09 +0200
Subject: [Buildroot] [PATCH 2/6] uclibc: add libgcc_s_resume fix
In-Reply-To: <20150614223347.3f0525b4@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 14 Jun 2015 22:33:47 +0200")
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614162409.GC8165@tarshish>
 <20150614223347.3f0525b4@free-electrons.com>
Message-ID: <87d20n74zq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Gah, again a copy/paste issue (though different than the previous one).
 > The full error message is:

 >   LD librt-0.9.33.2.so
 > librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
 > rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
 > collect2: error: ld returned 1 exit status
 > make[2]: *** [lib/librt.so] Error 1

 > I'll update the commit log accordingly.

Thanks, please send an updated patch with that fixed.

-- 
Bye, Peter Korsgaard
