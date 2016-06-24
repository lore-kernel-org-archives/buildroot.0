From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 24 Jun 2016 09:17:25 +0000
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160624111533.2b2ad08b@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <4209f432-0fbd-8d44-7194-c99829f66e2e@smile.fr>
 <1466574249.3622.15.camel@synopsys.com>
 <1466753076.30418.15.camel@synopsys.com>
 <20160624093205.722fc199@free-electrons.com>
 <1466759530.3244.45.camel@synopsys.com>
 <20160624111533.2b2ad08b@free-electrons.com>
Message-ID: <1466759786.3244.49.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-06-24 at 11:15 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 24 Jun 2016 09:13:09 +0000, Alexey Brodkin wrote:
> 
> > 
> > Agree. And we have necessary hooks already in place (remember that trick with "missing"
> > script) so that should be easy.
> > 
> > Still we'll need first to add makeinfo/texinfo package, right?
> Yes. But we used to have a host texinfo package
> (https://git.busybox.net/buildroot/commit/?id=69aeb066a68108e0f78af34d5baf770c490954d0)
> so it should be easy to re-introduce it.

Yeah I was pretty sure I saw something like that in past thus was the question :)

Thanks for the pointer!

-Alexey
