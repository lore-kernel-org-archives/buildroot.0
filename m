From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 12 Jan 2012 09:17:31 +0100
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <87r4z59ape.fsf@macbook.be.48ers.dk>
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <20120105163648.3bf64bcd@skate>
 <878vle9mp1.fsf@macbook.be.48ers.dk>
 <CAAXf6LX5xef3YE0zO0mDZxaFZ3s8NpfPU_jQaDxq0h-XCWOqxQ@mail.gmail.com>
 <87r4z59ape.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LWuCp1xHY2TnXysBsfeh0c_EDtWnBV=CKR8V8f6Vws5Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 11, 2012 at 10:43 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
> ?>> I agree. What about marking it as deprecated for now?
>
> ?Thomas> I'm currently using the customize package to add externally
> ?Thomas> built packages to a buildroot distribution, so that they are
> ?Thomas> not removed upon make clean. ?I'd like such a feature to be
> ?Thomas> preserved, in one way or another.
>
> So you mean prebuilt binaries, not just custom packages?

Yes, correct.
But, on a second thought, I could use the post_build script combined
with a directory for rootfs_additions for this. The principle is the
same I think.

So, unless I overlooked something, my use case for customize has disappeared...
