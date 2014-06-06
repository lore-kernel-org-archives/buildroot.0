From: psnsilva <psnsilva.stuff+nabble@gmail.com>
Date: Fri, 6 Jun 2014 09:42:28 -0700 (PDT)
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <20140606162737.GB3481@free.fr>
References: <1401897756168-71600.post@n4.nabble.com>
 <20140604170914.GA3325@free.fr> <1401963933710-71653.post@n4.nabble.com>
 <20140605192113.GE3553@free.fr> <1402062388810-71727.post@n4.nabble.com>
 <20140606162737.GB3481@free.fr>
Message-ID: <1402072948875-71738.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am generating the ext4 file system within buildroot. What I did here was,
after the first boot, to force the check every boot issuing the command
"tune2fs -C 2 -c 1 /dev/mmcblk0p2". But seems like I have no need for doing
it.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Check-root-file-system-at-boot-time-tp71600p71738.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
