From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:43:58 +0200
Subject: [Buildroot] [PATCH next] flex: only prevent the flex binary to
 be built for target, not for host
In-Reply-To: <20170523102201.65497-1-Vincent.Riera@imgtec.com>
References: <20170523102201.65497-1-Vincent.Riera@imgtec.com>
Message-ID: <20170523154358.0f20e636@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 11:22:01 +0100, Vicente Olivert Riera wrote:
> We do want to build the flex binary when building host-flex since it's
> needed as a build dependency for other packages.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...ntation.patch => 0001-flex-disable-documentation.patch} | 14 +-------------
>  package/flex/flex.mk                                       |  5 +++++
>  2 files changed, 6 insertions(+), 13 deletions(-)
>  rename package/flex/{0001-flex-disable-flex-binary-and-documentation.patch => 0001-flex-disable-documentation.patch} (55%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
