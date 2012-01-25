From: David Lynch Jr. <dhlii@dlasys.net>
Date: Wed, 25 Jan 2012 16:37:24 -0500
Subject: [Buildroot] Kconfig
In-Reply-To: <201201252221.21220.yann.morin.1998@free.fr>
References: <1327518856.21058.53.camel@hp-dhlii>
 <201201252221.21220.yann.morin.1998@free.fr>
Message-ID: <1327527444.19793.30.camel@hp-dhlii>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks;

That's a good start. 

So how did you work things out for your project ?
By tearing an existing setup apart or is there actually docs somewhere ?

I think I am pretty competent with the Kconfig structures - though I do
nto recall every having seen them documented, there are plent of
examples for how to do things inside the linux kernel source. 
All the sub makefiles are pretty trivial. 

I think i am reasonably competent with Makefiles - though I think
complex makefiles are a Write only language. 
But i will confess that more than trivial changes to the Linux
(buildroot, ...) Makefiles are pushing my limits.

I have done very little with autoconf, and was no aware that it had
anything to do with the Kconfig build scheme. 

But again, I think it is a wonderful means of managing something that
needs myriads of possible build permutations, but I have never seen any
real documentation. 





On Wed, 2012-01-25 at 22:21 +0100, Yann E. MORIN wrote:
> David, All,
> 
> On Wednesday 25 January 2012 20:14:16 David Lynch Jr. wrote:
> > This is probably not the right list for this, but I have a project that 
> > makes sense to use the configuration system that BareBox, BuildRoot,
> > the 
> > Linux Kernel and some other things are using.
> > 
> > Where can I find some documentation, information to try to get this 
> > setup for a new project.
> 
> As it happens, I have just started working on this myself. I created a
> package with just the kconfig parser and frontends, and just added the
> required autotools-glue around these. This is not yet complete, but it
> Works For Me (TM).
> 
> The Mercurial repository is available there:
>    http://ymorin.is-a-geek.org/hg/kconfig-frontends/
> 
> Don't expect this to be its permanent home. Also, don't expect that the
> repository content is stable. This is just preliminary work. I have no
> plan yet as to how I will handle releases, and how the version numbering
> will be handled, and stuff like that...
> 
> Note also that it's just about the parser and frontends, and does not
> contain the build-system itself.
> 
> I will announce it shortly on the linux-kbuild mailing list...
> 
> Regards,
> Yann E. MORIN.
> 
