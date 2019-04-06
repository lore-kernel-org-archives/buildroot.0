From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Apr 2019 09:14:50 +0200
Subject: [Buildroot] [PATCH v2] package/make: include patch for gl_lstat
 support
In-Reply-To: <4fc8912ff2e937c24c86d5fa4a132c9389bc62c9.camel@mendozajonas.com>
 (Samuel Mendoza-Jonas's message of "Sat, 06 Apr 2019 15:34:31 +1100")
References: <20190404225457.5075-1-sam@mendozajonas.com>
 <87ftqwp80d.fsf@dell.be.48ers.dk>
 <4fc8912ff2e937c24c86d5fa4a132c9389bc62c9.camel@mendozajonas.com>
Message-ID: <87zhp3mwph.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

 > On Fri, 2019-04-05 at 21:27 +0200, Peter Korsgaard wrote:
 >> > > > > > "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com>
 >> > > > > > writes:
 >> 
 >> > Include upstream commit 193f1e8 "glob: Do not assume glibc glob
 >> > internals". Without this if building glibc with host-make it will
 >> fail
 >> > with a segfault in make:
 >> 
 >> >>>> glibc glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
 >> Building
 >> 
 >> Committed, thanks.
 >> 
 >> Given the glibc version, I take it tht 2019.02.x is also affected?
 >> 

 > Yes it is, I forgot to add that note in v2.

Ok - Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
