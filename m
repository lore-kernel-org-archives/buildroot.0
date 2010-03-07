From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Mar 2010 17:39:13 +0100
Subject: [Buildroot] [PATCH RESEND] Fix autotools instalation with
 symbols
In-Reply-To: <20100307153359.10213.62431.stgit@localhost.localdomain>
References: <20100307153359.10213.62431.stgit@localhost.localdomain>
Message-ID: <20100307173913.401faec3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 07 Mar 2010 17:33:59 +0200
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> When installing without symbols install-strip is used,
> with symbols - install-exec.
> Since install-exec installs only executables, we should use
> simple install, to install other needed files also
> (like files in /usr/shared) as install-strip does.
> 
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
