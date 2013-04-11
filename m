From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 10:10:05 +0200
Subject: [Buildroot] [PATCH 2/2] support/kconfig: add support for
	olddefconfig
In-Reply-To: <1365110666-3080-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365110666-3080-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CACXmViYv0iNPVcxLsg-NYVTb0iAf9P446PG8o3PyhS62Z_=BbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 4, 2013 at 11:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> olddefconfig is a new target available in kconfig that allows to take
> an old .config file, and update it to the latest version of the code,
> without being asked for questions: it automatically assumes the
> default value for options whose value was not defined.
>
> It for example allows to take a minimal defconfig, copy it as .config,
> and do 'make olddefconfig' to get the full .config.

Committed, thanks.

--
Bye, Peter Korsgaard
