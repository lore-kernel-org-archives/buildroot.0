From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 7 Dec 2006 23:55:29 +0800
Subject: [Buildroot] Error on compiling busybox using buildroot for
	mipsel
In-Reply-To: <20061207140403.GA750@aon.at>
References: <b2ec5cad0612070448k18505301y83362b48b8afed4c@mail.gmail.com>
	<20061207140403.GA750@aon.at>
Message-ID: <b2ec5cad0612070755o45f5890ar436269589c0da699@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/7/06, Bernhard Fischer  wrote:
> On Thu, Dec 07, 2006 at 08:48:03PM +0800, Doug Brewer wrote:
> >Hello,
> >
> >I used buildroot to build mipsel crss-compiler and busybox. While compilng
> >on busybox, I encounter errors:
>
> >It looks that buildroot passed the wrong arch for busybox? Thanks.
>
> Does it work better (i.e. does not pull in i386-specific Makefiles) if
> you add ARCH=$(KERNEL_ARCH)  to both make invocations in busybox.mk ?

It works, thanks. I think developers may apply patch to buildroot :-P

BR,
Doug.
