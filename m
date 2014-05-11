From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 May 2014 18:29:49 +0200
Subject: [Buildroot] Autobuilder news
In-Reply-To: <536E8BEB.7020300@mind.be>
References: <20140504223611.5a6177c1@skate>
	<536E8BEB.7020300@mind.be>
Message-ID: <20140511182949.55e5e115@free-electrons.com>
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

No, it is not possible. The new toolchains have a different tarball
name, and all the tarballs from the previous ctng configurations have
been kept. So all builds made on the Free Electrons build server should
be fully reproducible.

Have you found any specific issue?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
