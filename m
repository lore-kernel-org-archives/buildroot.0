From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 09:48:42 +0100
Subject: [Buildroot] [PATCH] pkg-perl: set PERL_USE_UNSAFE_INC
In-Reply-To: <20170107081217.13863-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 7 Jan 2017 09:12:17 +0100")
References: <20170107081217.13863-1-francois.perrad@gadz.org>
Message-ID: <87lgukpqj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Recent perls are built with the `default_inc_excludes_dot` option.
 > As many CPAN modules rely on '.' in @INC, the toolchain
 > must set `PERL_USE_UNSAFE_INC`.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

As this is for our own host-perl, couldn't we just disable this option
at build time?

-- 
Bye, Peter Korsgaard
