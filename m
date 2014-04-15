From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:08:37 +0200
Subject: [Buildroot] [PATCH] fdk-aac: Disable for MIPS I, II, III and IV
In-Reply-To: <1397559931-35479-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1397559931-35479-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140415210837.313f7f3c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 15 Apr 2014 12:05:31 +0100, Vicente Olivert Riera wrote:
> This package uses the 'msub' instruction which is available only in
> mips32 and mips64 ISAs.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/fdk-aac/Config.in |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

I've replicated the new dependency on the comment about C++, and
applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
