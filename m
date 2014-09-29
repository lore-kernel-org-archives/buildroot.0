From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 11:18:53 +0200
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
Message-ID: <20140929111853.6881f323@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kantanu Kumar Mohapatra,

On Mon, 29 Sep 2014 13:08:38 +0530, Kantanu Kumar Mohapatra wrote:

> I am using customized uboot-tools 2010.03 and want to retain that. In 2014,
> the tools selection is new, but I want to use the source code for
> uboot-tools used in 2010.03, as this is having some changes. I want to get
> the "fw_printenv" compiled with a "-D" flag.
> 
> Can anyone please help me in this regard?

Well, just add a patch in package/uboot-tools/ to make whatever change
you want to the U-Boot source code used for your U-Boot tools.

Or am I missing something?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
