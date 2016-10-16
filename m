From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 18:06:36 +0200
Subject: [Buildroot] [PATCH 1/3] libite: new package
In-Reply-To: <20161013034247.21603-1-bluemrp9@gmail.com>
References: <20161013034247.21603-1-bluemrp9@gmail.com>
Message-ID: <20161016180636.372508ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Oct 2016 20:42:45 -0700, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  DEVELOPERS                 |  3 +++
>  package/Config.in          |  1 +
>  package/libite/Config.in   | 15 +++++++++++++++
>  package/libite/libite.hash |  2 ++
>  package/libite/libite.mk   | 14 ++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/libite/Config.in
>  create mode 100644 package/libite/libite.hash
>  create mode 100644 package/libite/libite.mk

The DEVELOPERS change should have been part of a separate patch. We do
this to ease the work of backporting changes in older Buildroot
releases (the changes in DEVELOPERS file tend to cause a large number
of conflicts).

I also rewrapped the Config.in help text, and adjusted the license
information to be more precise.

With those changes: applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
