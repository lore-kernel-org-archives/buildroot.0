From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:50:25 +0100
Subject: [Buildroot] [PATCH next v2] cmake: bump version to 3.7.0
In-Reply-To: <20161114131541.54948-1-Vincent.Riera@imgtec.com>
References: <20161114131541.54948-1-Vincent.Riera@imgtec.com>
Message-ID: <20161125235025.07ee3943@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 13:15:41 +0000, Vicente Olivert Riera wrote:
> libuv is now a required dependency.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Do not say that !BR2_STATIC_LIBS dependency is there only because libuv
> ---
>  package/cmake/Config.in  | 9 +++++++--
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 6 +++---
>  3 files changed, 12 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
