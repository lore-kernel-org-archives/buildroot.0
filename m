From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 23 Oct 2009 08:49:54 +0200
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <2c9a759f0910222319oa156407g4aa46caef5af7f0@mail.gmail.com>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
	<1256240439.25025.32.camel@coalu.atr>
	<2c9a759f0910222319oa156407g4aa46caef5af7f0@mail.gmail.com>
Message-ID: <1256280594.30127.1.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 23 octobre 2009 ? 08:19 +0200, Anders Darander a ?crit :
> Hi Lionel,
> 
> On Thu, Oct 22, 2009 at 21:40, Lionel Landwerlin <llandwerlin@gmail.com> wrote:
> > Maybe you could add
> >
> >        depends on BR2_TOOLCHAIN_EXTERNAL
> >
> > to your BR2_TOOLCHAIN_EXTERNAL_GDBSERVER option.
> 
> Sure that would be no problem.
> 
> However, I don't really see what that would gain us. Currently, the
> option in the menu is guarded the the 'if
> BR2_TOOLCHAIN_EXTERNAL'-clause that extends to the whole Config.in I'm
> touching... Thus, I believe that we already have this implicitly. Or
> am I missing something else that an added depend-statement would gain
> us?
> 

Yeah sorry, I didn't see the 'if BR2_TOOLCHAIN_EXTERNAL' at the top of
the file. Forget about it :)


-- 
Lionel Landwerlin <llandwerlin@gmail.com>
