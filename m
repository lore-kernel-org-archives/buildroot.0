From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 11:02:15 +0100
Subject: [Buildroot] [PATCH] board/pc/post-build.sh: fix typo in grub
 boot.img path
In-Reply-To: <20191216093119.1747699-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 16 Dec 2019 10:31:18 +0100")
References: <20191216093119.1747699-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pngod1w8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit 3468ef16fa55610bae3bacefaf816231a20cfab0
 > ("configs/pc_x86_64_efi: use genimage GPT partition table support")
 > had a small typo on the path to grub boot.img file: i387-pc instead of
 > i386-pc, which causes a build failure.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/378314412

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
 > Cc: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
