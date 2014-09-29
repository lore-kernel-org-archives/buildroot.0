From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 18:38:24 +0200
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
 <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
 <20140929152136.4d7cee9c@free-electrons.com>
 <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
Message-ID: <20140929183824.5b7bc3e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kantanu Kumar Mohapatra,

On Mon, 29 Sep 2014 21:29:40 +0530, Kantanu Kumar Mohapatra wrote:

> ?Frankly Speaking, I want to build fw_printenv in uboot-2010.03(for
> buildroot-20104.03), in uboot-2010.03 way. Is it possible??

Yes, in this case, just edit uboot-tools.mk and adapt it to take
sources from U-Boot 2010.03.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
