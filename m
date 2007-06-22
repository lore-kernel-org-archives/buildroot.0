From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 22 Jun 2007 23:07:30 +0200
Subject: [Buildroot] Help Building Buildroot
In-Reply-To: <1182545730.3733.20.camel@max.vermark.net>
References: <20070622084710.5B20648010@busybox.net>
	<f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
	<1182533072.3733.7.camel@max.vermark.net>
	<20070622182054.GC2799@aon.at> <20070622190236.GA3480@aon.at>
	<1182539747.3733.9.camel@max.vermark.net>
	<1182545730.3733.20.camel@max.vermark.net>
Message-ID: <20070622210730.GC4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 04:55:30PM -0400, A M wrote:
>Update:
>
>Now I have a different error which is still related to ccache.

Works fine here. rm -rf toolchain_* build_* and retry. Sounds like the
non-working ccache from before did damage your compiler.

>I have attached config.log from  buildroot/build_i586/ccache-2.4
>directory.
>
>I have also noticed that under buildroot/build_i586/staging_dir/usr/bin
>there is a broken link for cc -> gcc. cc is link to gcc which is not
>there.

I saw that too, but IIRC this is there since ages, you can safely ignore
it (does anybody know why it is there?).
