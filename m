From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 23:11:49 +0200
Subject: [Buildroot] [PATCH] ima-evm-utils: Add as new package
In-Reply-To: <20190729223810.24617-1-petr.vorel@gmail.com>
References: <20190729223810.24617-1-petr.vorel@gmail.com>
Message-ID: <20190730211147.GA8530@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Upstream patch from upcoming release is needed to fix build.
> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).

v2 will be needed. All tests fails when tested with ./utils/test-pkg:
Makefile:579: *** keyutils is in the dependency chain of ima-evm-utils that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
Sorry for not catching it before.

And 1.2.1 has been released and uploaded to sourceforge.

Kind regards,
Petr
