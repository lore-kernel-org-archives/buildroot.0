From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:35:56 +0100
Subject: [Buildroot] [PATCH 3/3] ffmpeg: default to --cpu=generic for
 MIPS architecture
In-Reply-To: <1458309966-16835-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1458309966-16835-1-git-send-email-Vincent.Riera@imgtec.com>
 <1458309966-16835-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160319143556.34d7b41a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 18 Mar 2016 14:06:06 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ffmpeg/ffmpeg.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Why ? Your commit log only says what the patch is doing, but not why.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
