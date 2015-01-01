From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 11:30:34 +0100
Subject: [Buildroot] [PATCH v2 4/7] Adding libsrtp
In-Reply-To: <1418398967-2183-5-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-5-git-send-email-gregd72002@gmail.com>
Message-ID: <20150101113034.78251c0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:44 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/libsrtp/Config.in    |  5 +++++
>  package/libsrtp/libsrtp.hash |  1 +
>  package/libsrtp/libsrtp.mk   | 13 +++++++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 package/libsrtp/Config.in
>  create mode 100644 package/libsrtp/libsrtp.hash
>  create mode 100644 package/libsrtp/libsrtp.mk

Thanks, applied, after doing numerous changes:

[Thomas:
 - Add better Config.in help text and fix its indentation
 - Fix comment header in .mk file
 - Uncomment useful commented lines in .mk file (SITE and AUTORECONF)
 - Add LICENSE_FILES variable.
 - Add handling of static/shared libraries build/installation.
 - Add dependency on host-pkgconf, so that libsrtp installs its own
   .pc file.
 - Add optional dependency on OpenSSL.
 - Use github helper.
 - Remove hash file, since we're downloading from Git.]

See
http://git.buildroot.net/buildroot/commit/?id=10f42fa8ae8d05bf36fd5e65f0ab2a1315cab18d
for the final commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
