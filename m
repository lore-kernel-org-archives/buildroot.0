From: Mark Jackson <mpfj@mimc.co.uk>
Date: Tue, 22 Jul 2008 20:31:00 +0100
Subject: [Buildroot] Debugging VICE emulator for AVR32
In-Reply-To: <877iclx5ur.fsf@macbook.be.48ers.dk>
References: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
	<877iclx5ur.fsf@macbook.be.48ers.dk>
Message-ID: <48863574.4040806@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> I've also noticed pthread problems with avahi on uclibc 0.9.29 (on
> PPC), but I haven't had time to debug it yet. The same setup works
> with 0.9.28.3
Hi Peter,

I'm also having problems with avahi-daemon segfaulting (on the NGW100 
defconfig plus avahi).

I raised a ticket on avahi.org (http://avahi.org/ticket/224), and after 
a bit of novice gdb investgations have shown up a "pthread" function may 
well be the cause.

In case of a post 0.9.29 bug fix, I did try to use the uclibc daily 
snapshot, but it didn't compile at all.

Did you manage to get anywhere with this, or is it still outstanding ?

Regards
Mark
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpfj.vcf
Type: text/x-vcard
Size: 290 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080722/ada74086/attachment.vcf 
