From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 2 Apr 2009 11:56:13 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:
	binutils	external-toolchain gcc uClibc
In-Reply-To: <d6cda7730903311943o576aa1a9p932aecc9f5ada27f@mail.gmail.com>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf> <87prfyald1.fsf@macbook.be.48ers.dk>
	<d6cda7730903301256r2e9adf8bmf613118daf62eb61@mail.gmail.com>
	<20090401012841.585dc38e@surf>
	<d6cda7730903311943o576aa1a9p932aecc9f5ada27f@mail.gmail.com>
Message-ID: <20090402005613.GE29488@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 31, 2009 at 11:43:09PM -0300, Thiago A. Corr?a wrote:
> Hi,
> 
> 2009/3/31 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > Le Mon, 30 Mar 2009 16:56:54 -0300,
> > Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :
> >
> >> Would that be a bad thing? Even if it's not integrated but a script,
> >> say: ./script/fix-external-toolchain.sh
> >>
> >> Before/after running kconfig.
> >>
> >> It beats having the user to guess or remember.
> >
> > Or maybe we could just *not* show these options, and let a script
> > auto-detect the values. For uClibc, they can easily be guessed from
> > some uClibc-config.h script available in the toolchain.
> 
> It must be "guessed" before entering kconfig because of the package
> options that depend on them. Specially large file support and IPv6.

Should those options (particularly large file support) just become
standard ie required?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
