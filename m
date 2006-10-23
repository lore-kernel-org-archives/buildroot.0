From: Itzhak Ben-Akiva <itzhakba@commtact.co.il>
Date: Mon, 23 Oct 2006 14:28:21 +0200
Subject: [Buildroot] make: *** No rule to make target `linux',
	needed	by `pcmcia'. Stop.
In-Reply-To: <20061023121027.GB13298@aon.at>
References: <1161601256.31399.4.camel@benakiva-laptop>
	<20061023121027.GB13298@aon.at>
Message-ID: <1161606501.31399.7.camel@benakiva-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2006-10-23 at 14:10 +0200, Bernhard Fischer wrote:

Hi Bernhard,

> On Mon, Oct 23, 2006 at 01:00:56PM +0200, Itzhak Ben-Akiva wrote:
> >Hi all,
> >
> >Now, after compiling busybox successfully, the compilation falls in
> >make: *** No rule to make target `linux', needed by `pcmcia'. Stop.
> >
> >I compiled buildroot successfully on 15/Oct/2006 without such an error.
> >Currently, I'm building the toolchain (gcc-4.1.1, binutils-2.17, linux
> >kernel header 2.6.18)
> 
> kernel-headers 2.6.18 are experimental. That said, did you enable a
> kernel for your device?
> 
What you mean by "did you enable a kernel for your device?"
Am I missing any necessary "customisation"?

> >
> >Any help is welcomed.
> 
> I don't use the pcmcia package and use a generic x86 kernel that is not
> checked into svn, so i can't really help you, sorry.
