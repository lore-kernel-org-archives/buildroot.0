From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 13:06:10 +0100
Subject: [Buildroot] [PATCH v2] imagemagick: bump version to 7.0.3-7
 (security)
In-Reply-To: <20161116112900.63183-1-Vincent.Riera@imgtec.com>
References: <20161116112900.63183-1-Vincent.Riera@imgtec.com>
Message-ID: <20161116130610.56f2d480@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 11:29:00 +0000, Vicente Olivert Riera wrote:
> oss-security reference:
>   http://www.openwall.com/lists/oss-security/2016/11/13/1
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Mark this patch for master instead of next because it fixes a
>    security issue. Also added oss-security reference.
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. I wonder how many security vulnerabilities
have been found in imagemagick over the last year. Seems like we bump
it almost every week for security fixes :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
