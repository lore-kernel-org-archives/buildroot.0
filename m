From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:32:48 +0200
Subject: [Buildroot] [PATCH] network-manager: Don't build Qt example
 programs
In-Reply-To: <1396624973-58181-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1396624973-58181-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140404233248.23e9cd8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 4 Apr 2014 16:22:53 +0100, Vicente Olivert Riera wrote:
> The purpose of "--enable-qt" option is not to build NetworkManager with
> Qt support. It's name can be a bit confusing. The real purpose of this
> option is to build Qt example programs, so we disable it as we also
> disable the tests and documentation in the target.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/3b6/3b6a40c1683d0859a934e4d79e2048e97b193e94/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/network-manager/network-manager.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
