From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Feb 2007 18:25:31 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <200702072124.30009.yann.morin.1998@anciens.enib.fr>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<200702012015.55089.yann.morin.1998@anciens.enib.fr>
	<1170878990.10007.4.camel@ndragon.eng.wgate.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070208172531.GB8945@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 07, 2007 at 09:24:29PM +0100, Yann E. MORIN wrote:
>On Wednesday 07 February 2007 210, James Newell wrote:
>> Has any one had any progress with building uclibc default soft float
>> using gcc 4.1.1?
>
>Yes.
>
>Short answer: it does not work.
>See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=29329  [1]
>(not directly related, but yet, useless on ARM).

It would be of tremendous help to have one non-float mmu-less config for
a kernel that i can check against qemu (i.e. run the resulting
filesystem and kernel via current qemu).

Does anybody have such a .config i could play with?
