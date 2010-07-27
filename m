From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 27 Jul 2010 23:20:21 +0200
Subject: [Buildroot] build failed - cannot stat libz.so*
In-Reply-To: <87y6cwbpj6.fsf@macbook.be.48ers.dk>
References: <20100727190310.GA10996@merkur.ravnborg.org>
	<20100727211845.1941d75a@surf> <87y6cwbpj6.fsf@macbook.be.48ers.dk>
Message-ID: <20100727212021.GA18004@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 27, 2010 at 11:09:17PM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  Thomas> Do you have a particular reason for using static libraries ?
> 
>  Thomas> Peter, do we want to support static libraries ?
> 
> ideally yes, if we can find manpower to do so. It's quite nice for the
> initramfs case.
> 
> But Thomas is right, we don't support it properly today. I believe Sam
> is using it because the shared lib stuff on Sparc is broken in uclibc.

I only selected it to use a simple setup - was not aware
of any issues in uclibc.

Will initially try to rebuild with static libraries
disabled to see if the build is successfull.

	Sam
