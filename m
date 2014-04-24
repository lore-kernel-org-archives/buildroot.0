From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 15:20:34 +0200
Subject: [Buildroot] [PATCHv2 4/6] binutils: enable for aarch64
In-Reply-To: <20140424040446.GC22908@tarshish> (Baruch Siach's message of
 "Thu, 24 Apr 2014 07:04:46 +0300")
References: <1398301235-8445-1-git-send-email-gustavo@zacarias.com.ar>
 <1398301235-8445-4-git-send-email-gustavo@zacarias.com.ar>
 <20140424040446.GC22908@tarshish>
Message-ID: <8738h23lul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Gustavo,
 > On Wed, Apr 23, 2014 at 10:00:33PM -0300, Gustavo Zacarias wrote:
 >> Versions lower than 2.24 fail to build a working kernel as in:
 >> 
 >> Freeing unused kernel memory: 184K (ffffffc00059a000 - ffffffc0005c8000)
 >> init[1]: unhandled level 2 translation fault (11) at 0x00000008, esr
 >> 0x92000006
 >> pgd = ffffffc876403000
 >> [00000008] *pgd=00000008f6ea0003, *pmd=0000000000000000
 >> 
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---

 > The subject line is misleading. This patch actually disables aarch64 for
 > binutils < 2.24.

Agreed. I have changed the subject to reflect that and committed,
thanks.

-- 
Bye, Peter Korsgaard
