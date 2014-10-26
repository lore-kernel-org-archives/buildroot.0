From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:16:49 +0100
Subject: [Buildroot] [PATCH 3/3] manual: Add notes about GitHub and
 hashes
In-Reply-To: <20141026171305.GB3592@free.fr>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
 <20141026180855.6aa51f07@free-electrons.com>
 <20141026171305.GB3592@free.fr>
Message-ID: <20141026181649.14020383@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Oct 2014 10:13:05 -0700, Yann E. MORIN wrote:

> > I don't really understand this. If the tarball is automatically
> > generated, then it should always be the same for a given version/tag of
> > a certain repository, no?
> 
> The content of the extracted archive is always the same, except for
> timestamps, so, the archive is not reproducible itself.

The timestamps change each time you generate the tarball? This would be
really weird from github to not have planned to make the tarballs
reproducible for a given version of the repository. If that's really
the case, then maybe it's something we should report to github?

> But then that's the case for generated tarballs from github: we have
> absolutely no way to check them, unless we want to have hashes for the
> extracted files themselves (which I doubt we want, as it would be a
> nightmare to handle).

Indeed, we don't want to go this way.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
