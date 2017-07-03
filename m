From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 23:59:12 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com> (Wolfgang
 Grandegger's message of "Mon, 3 Jul 2017 19:47:20 +0200")
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <877ezp780a.fsf@dell.be.48ers.dk>
 <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com>
Message-ID: <87podh5gi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

 > Hello Peter,
 > Am 03.07.2017 um 19:19 schrieb Peter Korsgaard:
 >>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
 >> 
 >> > Hello,
 >> > I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why
 >> > the address sanitizer library "libasan.so*" is not available in the
 >> > rootfs of the target. Is it intentional? And what is the best way to
 >> > get it added to the rootfs?
 >> 
 >> Is this with uClibc-ng, musl or Glibc?

 > It's with Glibc. I think the libsanitizer libs are built but not moved
 > to the target.

Correct. I've sent a patch fixing this for the internal and external
toolchain. Could you give it a try?

https://patchwork.ozlabs.org/patch/783661/
https://patchwork.ozlabs.org/patch/783660/

-- 
Bye, Peter Korsgaard
