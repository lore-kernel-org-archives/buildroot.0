From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Mar 2016 13:36:31 +0000
Subject: [Buildroot] [PATCH] dt: add patch to fix failures on newer
 toolchains
In-Reply-To: <1458561364-941-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1458561364-941-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <56EFF8DF.6050601@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 21/03/16 11:56, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> On newer toolchains (glibc >= 2.20) _BSD_SOURCE behaviour was deprecated
> in favour if the _DEFAULT_SOURCE macro. See man 7 feature_test_macros.
> Add patch from Fedora to also consider _DEFAULT_SOURCE. Fixes:
> http://autobuild.buildroot.net/results/9e2/9e2126b0e68d0d59d37616a268adb810efd8281a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I was in contact with upstream to fix this problem. I have shared the
Fedora patch and your explanation with them. Let's hope we can delete
this patch from Buildroot in the near future :P

Regards,

Vincent.
