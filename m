From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Oct 2012 23:20:16 +0200
Subject: [Buildroot] no /dev/console;
	/dev/null when booting with initrd of type 'ext2'
In-Reply-To: <20121016192700.01faa4e8@skate> (Thomas Petazzoni's message of
 "Tue, 16 Oct 2012 19:27:00 +0200")
References: <507D6C50.4060607@wanadoo.fr>
 <20121016142342.GA2131@mail.sceen.net> <507D8828.4020007@wanadoo.fr>
 <20121016162825.GA26334@mail.sceen.net>
 <20121016192700.01faa4e8@skate>
Message-ID: <87fw5eru5r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,


 Thomas> Maybe the devtmpfs mounting done by CONFIG_DEVTMPFS_MOUNT does
 Thomas> not take place when an initrd is used? I honestly don't know, I
 Thomas> don't use initrd personally.

I also don't use initrd's, but it's atleast not done for initramfs
(which is why we have the pre-init script in fs/cpio/init).

-- 
Bye, Peter Korsgaard
