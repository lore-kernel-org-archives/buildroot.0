From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Apr 2011 23:51:25 +0200
Subject: [Buildroot] JFFS2 Question
In-Reply-To: <BANLkTi=WFMS9Uv-x6H8iHO-vDFwRvdS2hA@mail.gmail.com> (Charles
	Krinke's message of "Sun, 24 Apr 2011 12:25:24 -0700")
References: <BANLkTi=WFMS9Uv-x6H8iHO-vDFwRvdS2hA@mail.gmail.com>
Message-ID: <87fwp78giq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

Hi,

 Charles> I seem to have gotten myself into a pickle (again) now that I
 Charles> have worked out the details of mounting a buildroot generated
 Charles> rootfs.jffs2.

 Charles> It boots on my MPC8323 target. I can "ls", "cd", "cat". But,
 Charles> .... when it boots, it complains a bit

 Charles> Write of 68 bytes at 0x002fc498 failed. returned -30, retlen 67087004
 Charles> Erase at 0x008a0000 failed immediately: -EROFS. Is the sector locked?

Did you configure jffs2 for the correct flash size? Are your flash
sectors locked (protected?) You can normally check in u-boot.

-- 
Bye, Peter Korsgaard
