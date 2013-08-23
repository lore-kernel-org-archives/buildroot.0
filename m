From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 23 Aug 2013 11:47:04 +0100
Subject: [Buildroot] [PATCH v3] toolchain-external: fix lib64 symlinks
In-Reply-To: <1377212375-22871-1-git-send-email-arnout@mind.be>
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
 <1377212375-22871-1-git-send-email-arnout@mind.be>
Message-ID: <CAG2jQ8idH=m7z07HjC=QQudQ_gnhp-TT1WtGkhPn6Lxy+Swk9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 22 August 2013 23:59, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> --
>
> Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d/
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Tested with a couple of 32-bit and 64-bit MIPS Sourcery toolchains, and with
> the x86_64 Sourcery toolchain. Should still be tested with a MIPS64/n32
> toolchain, and with Linaro.

Seems lib32->lib is created for MIPS64/n32 which was all it was needed
for MIPS64/n32 to work
properly. Thanks for the patch.

-- 
Regards,
Markos Chandras
