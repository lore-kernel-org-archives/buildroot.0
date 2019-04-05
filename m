From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 21:27:46 +0200
Subject: [Buildroot] [PATCH v2] package/make: include patch for gl_lstat
 support
In-Reply-To: <20190404225457.5075-1-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Fri, 5 Apr 2019 09:54:57 +1100")
References: <20190404225457.5075-1-sam@mendozajonas.com>
Message-ID: <87ftqwp80d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

 > Include upstream commit 193f1e8 "glob: Do not assume glibc glob
 > internals". Without this if building glibc with host-make it will fail
 > with a segfault in make:

 >>>> glibc glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 Building

Committed, thanks.

Given the glibc version, I take it tht 2019.02.x is also affected?

-- 
Bye, Peter Korsgaard
