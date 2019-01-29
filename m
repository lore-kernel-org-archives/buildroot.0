From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:33:56 +0100
Subject: [Buildroot] [PATCH] package/busybox: drop empty configure
 command
In-Reply-To: <31287_1548765380_5C5048C4_31287_396_1_f8e0aabc-6c1f-4878-b75e-c8bbc4e1a17e@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 (yann morin's message of "Tue, 29 Jan 2019 13:36:08 +0100")
References: <31287_1548765380_5C5048C4_31287_396_1_f8e0aabc-6c1f-4878-b75e-c8bbc4e1a17e@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <87fttb8om3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > Since commit 50dc350c65 (package/busybox: update to 1.29.0), we no
 > longer define the BUSYBOX_NOCLOBBER_INSTALL macro, so it expands to an
 > empty string, so we end up with no action in BUSYBOX_CONFIGURE_CMDS.

 > Drop BUSYBOX_CONFIGURE_CMDS now that it serves no purpose.

 > Signed-off-by: Yann MORIN <yann.morin@orange.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
