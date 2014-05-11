From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 May 2014 18:07:06 +0200
Subject: [Buildroot] Autobuilder news
In-Reply-To: <536E8BEB.7020300@mind.be>
References: <20140504223611.5a6177c1@skate>
	<536E8BEB.7020300@mind.be>
Message-ID: <20140511180706.4a6f449e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 10 May 2014 22:28:27 +0200, Arnout Vandecappelle wrote:

>  Is it possible that you installed new binaries with the same name but a
> different ctng configuration? That's a bit annoying because it breaks
> reproducibility... It's OK to remove the old toolchains, but it would be good if
> the new ones would have a different name.

No: the new toolchains have a different tarball names, and the old
toolchain tarballs were all kept at their original location with their
original name. So normally all the builds from the Free Electrons build
server should be reproducible, including the ones using older
Crosstool-NG toolchains.

Have you noticed any specific problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
