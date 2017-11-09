From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu,  9 Nov 2017 18:15:49 +0300
Subject: [Buildroot] [PATCH 0/2] python-numpy: disable for ARCompact
Message-ID: <20171109151551.4858-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python-numpy is not compiling for ARCompact due toolchain issue, so
it is necessary to disable this package. Before disabling the layout 
of BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS variable should be reconstructed 
to more convenient form. First patch reconstucts layout of this variable,
second patch disables python-numpy for ARCompact architecture.

Note this series replaces recently patches which were sent separately.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Evgeniy Didin (2):
  python-numpy: reformat config
  python-numpy: disable for ARCompact

 package/python-numpy/Config.in | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.11.0
