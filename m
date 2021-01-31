From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:22:51 +0100
Subject: [Buildroot] [PATCH 1/1] Replace LIBFOO_CPE_ID_VERSION_MINOR by
 LIBFOO_CPE_ID_UPDATE
In-Reply-To: <20210129175640.1016822-1-fontaine.fabrice@gmail.com>
References: <20210129175640.1016822-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131232251.509cdf91@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Jan 2021 18:56:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace LIBFOO_CPE_ID_VERSION_MINOR by LIBFOO_CPE_ID_UPDATE to better
> "comply" with the official "Well-Formed CPE Name Data Model" parameters:
>  - https://csrc.nist.gov/publications/detail/nistir/7695/final
>  - https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt          |  8 ++++----
>  package/libffi/libffi.mk                         |  2 +-
>  package/ntp/ntp.mk                               |  2 +-
>  package/openssh/openssh.mk                       |  2 +-
>  package/pkg-generic.mk                           | 16 ++++++++--------
>  package/runc/runc.mk                             |  4 ++--
>  package/sudo/sudo.mk                             |  4 ++--
>  package/wireless_tools/wireless_tools.mk         |  2 +-
>  .../package/cpe-id-pkg4/cpe-id-pkg4.mk           |  2 +-
>  .../package/cpe-id-pkg5/cpe-id-pkg5.mk           |  4 ++--
>  support/testing/tests/core/test_cpeid.py         | 10 +++++-----
>  11 files changed, 28 insertions(+), 28 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
