From: Heiko Helmle <helman@gmx.net>
Date: Tue, 9 Aug 2011 22:52:27 +0200
Subject: [Buildroot] Problems with udev buildroot
In-Reply-To: <87pqkfjdt0.fsf@macbook.be.48ers.dk>
References: <20110808200716.101270@gmx.net>
 <9BFF739A-9E25-4A0D-B689-418A498734F3@gmx.net>
 <87pqkfjdt0.fsf@macbook.be.48ers.dk>
Message-ID: <67B9BD44-098C-4B37-BF2F-A9872C63B3B1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 09.08.2011 um 08:31 schrieb Peter Korsgaard:
> 
> 
> We have native initramfs support in BR, which contains a workaround for
> the kernel not mounting devtmpfs - Why are you not using that?

I guess you mean the one that gets embedded in the kernel image automatically? I wasn't aware that in that case the filesystem receives a workaround. I'll try that next - thank you!

Best Regards
	Heiko
