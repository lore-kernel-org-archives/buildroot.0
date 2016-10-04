From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 09:18:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl: bump version to 5.24.0
In-Reply-To: <CAB0FRstXs7JNhBzmYqRyOddDdBLNvHvwU=AkYFR6UfsFLvJZKg@mail.gmail.com>
References: <20161003141728.25097-1-bernd.kuhls@t-online.de>
 <CAB0FRstXs7JNhBzmYqRyOddDdBLNvHvwU=AkYFR6UfsFLvJZKg@mail.gmail.com>
Message-ID: <20161004091851.65884a72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Oct 2016 06:02:49 +0200, Fran?ois Perrad wrote:

> perl-cross 1.1.0 is not mature (11 issues opened on september), it is
> a full refactor, there are already 19 commits after this tag.
> 
> I never bump a perl version 5.x.0, I always wait the version 5.x.1
> 
> If you really need a perl 5.24.0, cross-compiled it with
> perl-5.24.0-cross-1.0.3.
> 
> When I bump a perl version, I run on target the full Perl test suite
> (~ 800 000 tests), and failures are not expected.
> With cross-perl 1.0.3 and 1.1.0 tags, there have failures described in
> https://github.com/arsv/perl-cross/issues/33

OK, thanks for the explanations.

> Please, revert this commit.

I've reverted the commit.

Bernd, could you start using the get-developers script to ensure you
are CC'ing the right developers depending on the package you're
patching. This would have CC'ed Fran?ois in the case of this perl
related patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
