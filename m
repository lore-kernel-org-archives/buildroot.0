From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:17:42 +0100
Subject: [Buildroot] [PATCH v2] wireshark: bump version to 2.2.2
 (security)
In-Reply-To: <20161117155508.37814-1-Vincent.Riera@imgtec.com>
References: <20161117155508.37814-1-Vincent.Riera@imgtec.com>
Message-ID: <20161121231742.5f7ab934@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 15:55:08 +0000, Vicente Olivert Riera wrote:
> Release notes:
>   https://www.wireshark.org/docs/relnotes/wireshark-2.2.2.html
> 
> Security fixes:
>   wnpa-sec-2016-62. DTN infinite loop.
>   wnpa-sec-2016-61. DCERPC crash.
>   wnpa-sec-2016-60. OpenFlow crash.
>   wnpa-sec-2016-59. AllJoyn crash.
>   wnpa-sec-2016-58. Profinet I/O long loop.
> 
>   For more details: https://www.wireshark.org/security/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - rebase on top of master
>  - specify this is a security update in commit log
>  - add information regarding the security fixes in commit log
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
