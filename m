From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:49:25 +0200
Subject: [Buildroot] [git commit] imagemagick: fix magick++-config fixup
 error
In-Reply-To: <20130813082128.6C4929B2E2@busybox.osuosl.org>
References: <20130813082128.6C4929B2E2@busybox.osuosl.org>
Message-ID: <20130813114925.07bb66a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Tue, 13 Aug 2013 10:16:11 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=b339bb5641c59ad2e19aeb95c1387584c7c2aeab
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Magic++ bindings are built only with C++ and WCHAR toolchains.
> Add a WCHAR toolchain check for the magick++ config fixup.
> Looking into the future the fixup shouldn't bail on a missing file so we
> can avoid awkward kludges for packages that have many options and config
> files.
> Fixes:
> http://autobuild.buildroot.net/results/33a/33ac4b17866a64379b7bab3c0549f6e075c98dde/

Thanks, committed.

However, I think I disagree on the idea that the fixup shouldn't bail
on a missing file. Bailing out is the best way to notice that something
is wrong, otherwise problems remain unnoticed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
