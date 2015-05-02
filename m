From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 10:30:03 +0200
Subject: [Buildroot] [PATCH 3/3] package/wvstreams: add argp-standalone
 as optionnal dependency
In-Reply-To: <5543FC55.2040203@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
 <1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
 <20150501230402.57253929@free-electrons.com>
 <5543FC55.2040203@openwide.fr>
Message-ID: <20150502103003.4fb7370d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 02 May 2015 00:21:09 +0200, Romain Naour wrote:

> I'm agree, most of packages which uses argp.h select argp-standalone only when a
> uClibc toolchain is used.
> Except libpthsem package which select argp-standalone unconditionally.
> However, I built successfully libpthsem with a glibc toolchain and without
> argp-standalone installed.
> 
> It appears that argp.h from glibc is more up to date should be preferred to
> argp-standalone one.
> 
> I can do the change if you want.

That would be nice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
