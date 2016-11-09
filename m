From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 9 Nov 2016 07:59:44 +0100
Subject: [Buildroot] [PATCH 0/4] configs: atmel: update of old boards
Message-ID: <20161109065948.1851-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas reported me that some components (kernel or u-Boot) are no longer
compiling due to incompatibilities with gcc.

Since there is no longer official releases (linux4sam) for these products,
they will rely on mainline versions for U-Boot and Linux. AT91bootstrap is
bumped to a recent version.

Regards

Ludovic Desroches (4):
  configs: atmel: at91sam9260eknf: update defconfig
  configs: atmel: at91sam9rlek: update defconfig
  configs: atmel: at91sam9g20dfc: update defconfig
  configs: atmel: at91sam9g45m10ek: update defconfig

 configs/at91sam9260eknf_defconfig  | 29 +++++++++++++++--------------
 configs/at91sam9g20dfc_defconfig   | 21 ++++++++++-----------
 configs/at91sam9g45m10ek_defconfig | 23 ++++++++++++++---------
 configs/at91sam9rlek_defconfig     | 23 ++++++++++++++---------
 4 files changed, 53 insertions(+), 43 deletions(-)

-- 
2.9.0
