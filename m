From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 27 Jun 2012 22:36:43 +0300
Subject: [Buildroot] xbmc available in (for Rpi)
In-Reply-To: <CALR4fEJQjcH7HVc-Hiq8YpgUPms+oyv=O4JwHqzR0PoLcKwZ2w@mail.gmail.com>
References: <CAAfyv34srnfYZqxjQCxV-k0CPYVqwXK-zPBmB0UkoqrqGidShg@mail.gmail.com>
 <87wr2t5gq4.fsf@macbook.be.48ers.dk>
 <CALR4fEJQjcH7HVc-Hiq8YpgUPms+oyv=O4JwHqzR0PoLcKwZ2w@mail.gmail.com>
Message-ID: <CALR4fE+d=y4ANugDpWYo+eK1Vy+esN+UhfA1N-Lcfm4QiWifsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 27, 2012 at 5:06 PM, Diego Iastrubni <diegoiast@gmail.com> wrote:
>
> On Wed, Jun 27, 2012 at 10:58 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>
>> >>>>> "Belisko" == Belisko Marek <marek.belisko@gmail.com> writes:
>>
>> ?Belisko> Today during browsing found this:
>> ?Belisko> https://github.com/huceke/buildroot-rbp.
>>
>> ?Belisko> Seems xbmc with dependency libraries are added and even
>> ?Belisko> compiling in BR!
>>

I am missing something out here in git:

cd ~/src/buildroot [where my buildroot clone is)
git remote add rbp git://github.com/huceke/buildroot-rbp.git
git fetch rbp

Git is pulling now the whole remote repository. I was thinking it will
only pull the "diff" between builroot and buildroot-rbp ... as they
share a lot... no?

What am I doing wrong?
