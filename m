From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:43:13 +0100
Subject: [Buildroot] [PATCH 03/30] libsemanage: new package
In-Reply-To: <1418702062-61039-4-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1418702062-61039-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150101224313.792719f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 15 Dec 2014 21:53:55 -0600, Matt Weber wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Config.in                                  |  1 +
>  .../libsemanage/0001-execption-lib-path-fix.patch  | 14 +++++
>  package/libsemanage/Config.in                      | 30 +++++++++
>  package/libsemanage/libsemanage.mk                 | 72 ++++++++++++++++++++++
>  4 files changed, 117 insertions(+)
>  create mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
>  create mode 100644 package/libsemanage/Config.in
>  create mode 100644 package/libsemanage/libsemanage.mk

Patch applied. On this one, I did a mistake, and forgot to squash my
changes into your original commit, so you have three separate commits:

  http://git.buildroot.net/buildroot/commit/?id=77872678accd4d98cd3aa3d95a34738861844e31
  http://git.buildroot.net/buildroot/commit/?id=a963685245d4ad25b40520b251024720c3b18e11
  http://git.buildroot.net/buildroot/commit/?id=27d6b6ad5fd028bb650ad10ea163f8adcbf1383e

One thing to add would be Python 3 support, but I'll reply to your
cover letter with a more generic question about those packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
