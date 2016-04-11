From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 11 Apr 2016 17:02:08 +0200
Subject: [Buildroot] buildroot for pine64
Message-ID: <20160411170208.7880b2be@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just received my new Pine64 board and tried to integrate it into
the Buildroot. Howver, there is a catch. The system boots in 32-bit
mode so it requires to build the U-Boot by a 32-bit toolchain.

How to accomplish this with Buildroot? I am afraid, this is not
possible at the moment with a single BR defconfig file. Are
there more such boards? Is it a known issue?

Regards
Jan

-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
