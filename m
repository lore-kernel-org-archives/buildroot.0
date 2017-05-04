From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:19:12 +0200
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
In-Reply-To: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
Message-ID: <20170504231912.459b725a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 09:56:01 +0200, Stefan S?rensen wrote:
> Changes since v2:
>  * Add two upstream bugfixes
>  * Add patch to force grep to treat the words file as text
>  * Add $(HOST_MAKE_ENV) when build the dict 
> 
> Changes since v1:
>  * Update DEVELOPERS file
>  * Use SPDX license codes
>  * Use the tools from host-cracklib for generating dictionary files
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  DEVELOPERS                                         |   1 +
>  package/Config.in                                  |   1 +
>  .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 114 +++++++++++++++++++++
>  ...x-a-buffer-overflow-processing-long-words.patch |  49 +++++++++
>  ...to-treat-the-input-as-text-when-formattin.patch |  30 ++++++
>  package/cracklib/Config.in                         |  28 +++++
>  package/cracklib/cracklib.hash                     |   3 +
>  package/cracklib/cracklib.mk                       |  36 +++++++
>  8 files changed, 262 insertions(+)
>  create mode 100644 package/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
>  create mode 100644 package/cracklib/0002-Fix-a-buffer-overflow-processing-long-words.patch
>  create mode 100644 package/cracklib/0003-Force-grep-to-treat-the-input-as-text-when-formattin.patch
>  create mode 100644 package/cracklib/Config.in
>  create mode 100644 package/cracklib/cracklib.hash
>  create mode 100644 package/cracklib/cracklib.mk

You received quite a bit of feedback from Danomi and Romain. Could you
take it into account and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
