From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 22:43:41 +0100
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <CAAXf6LX5xef3YE0zO0mDZxaFZ3s8NpfPU_jQaDxq0h-XCWOqxQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 11 Jan 2012 20:50:57
 +0100")
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <20120105163648.3bf64bcd@skate> <878vle9mp1.fsf@macbook.be.48ers.dk>
 <CAAXf6LX5xef3YE0zO0mDZxaFZ3s8NpfPU_jQaDxq0h-XCWOqxQ@mail.gmail.com>
Message-ID: <87r4z59ape.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> I agree. What about marking it as deprecated for now?

 Thomas> I'm currently using the customize package to add externally
 Thomas> built packages to a buildroot distribution, so that they are
 Thomas> not removed upon make clean.  I'd like such a feature to be
 Thomas> preserved, in one way or another.

So you mean prebuilt binaries, not just custom packages?

-- 
Bye, Peter Korsgaard
