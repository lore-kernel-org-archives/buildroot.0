From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Oct 2018 13:40:24 +0300
Subject: [Buildroot] Custom C Libraries for RISC-V 32-bit Support
In-Reply-To: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
References: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
Message-ID: <20181003104024.ijzjzu6t4sp7cee3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

On Wed, Oct 03, 2018 at 11:26:53AM +0100, Mark Corbin wrote:
> I've been asked by a few people about adding RISC-V 32-bit support to
> Buildroot.
> 
> This would require the ability to select custom git repositories for C
> libraries. There is a glibc repository based on v2.26 that works for
> riscv32 and there is also a musl repository for riscv32/riscv64 that I'd
> like to test.
> 
> I'm happy to add support for custom C libraries, but was wondering what
> everybody's thoughts were on this?

We already support a custom version of glibc for the ARC architecture. See 
package/glibc/glibc.mk. Is there a plan to push upstream musl/glibc support 
for RISC-V 32-bit?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
