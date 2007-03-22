From: Erik Andersen <andersen@codepoet.org>
Date: Thu, 22 Mar 2007 10:40:17 -0600
Subject: [Buildroot] BSP patch
In-Reply-To: <01a101c76c8a$2450a4e0$01c4af0a@Glamdring>
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<01a101c76c8a$2450a4e0$01c4af0a@Glamdring>
Message-ID: <20070322164017.GB3907@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Mar 22, 2007 at 02:53:12PM +0100, Ulf Samuelsson wrote:
> 
> >>The BSP patch also put some structure on where the result ends up.
> >>Today everything is stored in the top directory, but if you
> >>want to build multiple boards, then you are going to get a lot of clutter.
> >
> > We need to better differentiate between arch and cpu (generally, not in
> > your board support patch).
> >
> > Applying your patch now locally. Let's see..
> >
> 
> Thank You,
> 
> So far the patch does not create anything, only defines locations.
> 
> The beef is in the patches that follows
> but I plan to submit the AVR32 toolset patches first.
> 
> The idea is to avoid keeping the toolset patches
> inside the buildroot,and instead download the patches
> before they are applied.

Mind sharing the the next patchset with us, so we can see where
you are going with this?  I do like the general idea and I
recognize the need to make changes such as you describe.  But I
would like to have a chance to review the actual changes you plan
to implement should this be applied...

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
