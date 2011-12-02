From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Dec 2011 15:59:22 +0100
Subject: [Buildroot] 2011.11 zlib headers problem?
In-Reply-To: <DAC204EF7EE84F359328546B86282CFD@beraninstruments.com.local>
 (Will Moore's message of "Fri, 2 Dec 2011 12:15:08 -0000")
References: <2DEA474F53884F0AA751ABAD42769383@beraninstruments.com.local>
 <DAC204EF7EE84F359328546B86282CFD@beraninstruments.com.local>
Message-ID: <87pqg7f29h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Moore <will.moore@beraninstruments.com> writes:

Hi,

 Will> So this is a internet / crosstool-NG toolchain thing and not a
 Will> 2011.08 / 2011.11 thing?

Must be. I do zlib/internal toolchain based builds almost daily without
problems.

ls output/staging/usr/include/z*
output/staging/usr/include/zconf.h  output/staging/usr/include/zlib.h

-- 
Bye, Peter Korsgaard
