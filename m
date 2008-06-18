From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 18 Jun 2008 16:39:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
In-Reply-To: <87ve063jt2.fsf@macbook.be.48ers.dk>
References: <20080618084529.3973AF8007@busybox.net>
	<20080618092206.GE32192@mx.loc>
	<87r6av59np.fsf@macbook.be.48ers.dk>
	<d6cda7730806180648u5bf7bd6esd4c882c3de6a118b@mail.gmail.com>
	<d6cda7730806180656p13917415j6ec9ea1b7307afb@mail.gmail.com>
	<87ve063jt2.fsf@macbook.be.48ers.dk>
Message-ID: <20080618143958.GA1929@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 04:21:45PM +0200, Peter Korsgaard wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
>Hi,
>
> >> I think it works without that patch even, as I didn't rename it on my
> >> local copy. Will remove it and try to build again just to make sure.
>
> Thiago> It built without that patch at all using atngw100_defconfig, which
> Thiago> doesn't enable Sus legacy options, so I think it's safe to remove that
> Thiago> patch.
>
>Ok, thanks - Removed in trunk.

thanks. Please be more careful.
Rule of thumb: Fewer patches are better.
