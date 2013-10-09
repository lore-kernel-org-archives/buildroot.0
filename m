From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 9 Oct 2013 08:23:27 +0100
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <5253392E.8060000@mind.be>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
 <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
 <20131004110704.78f5b1a6@skate>
 <OFD293F65F.D1285988-ON86257BFA.00549871-86257BFA.0055339A@rockwellcollins.com>
 <20131004173452.4f93d1c3@skate>
 <CAHt8ZCPpVROvLJ8Fb1TrtwMTLKfBcdCBDwH0k4m-QNfisPnugg@mail.gmail.com>
 <5253392E.8060000@mind.be>
Message-ID: <CAHt8ZCNVeoNRPxn0A7CX_NjEdQPh+f42P66=6xJWB-oMU+saHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 October 2013 23:43, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/04/13 17:46, Simon Dawson wrote:
>> This is an existing problem for the jquery package, where there is no
>> release tarball as such. It would be nice to be able to specify URLs
>> in the <pkg>_LICENSE_FILES variable.
>
>
>  +1.
>
>  Now to find a volunteer who implements it :-)
>
>  Ideally, such an external license should be downloaded already with 'make
> source'. Though that is perhaps stretching it a little...

This can now be achieved by using Thomas P's new <pkg>_EXTRA_DOWNLOADS
mechanism to download the license file(s); I wonder if that would be
an acceptable idiom in this situation...?

Simon.
