From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 29 Nov 2012 16:48:57 -0200
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <20121129193123.503b489b@skate>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
 <20121129113710.63d5676c@skate>
 <CAHt8ZCN5eB8shsxz+gVz6neYbwVC7kE-O=cT66MCTRQNq6o_qQ@mail.gmail.com>
 <20121129162848.5a761c63@skate>
 <CAHt8ZCO6Be2V+qPZ6Lu5y8kMaKipt2J=JgbbU7ZHqRXSF0c=tg@mail.gmail.com>
 <CAExDhvZUT2KpJfuxqg__y=PqpLYQsHXaSEa6s1Ni61UW6D4skQ@mail.gmail.com>
 <20121129190955.416f2373@skate>
 <CAExDhva8qpnukgyEAogo=cJhxZkdWaFU9ekPAujCgBtgMbaTOw@mail.gmail.com>
 <20121129193123.503b489b@skate>
Message-ID: <CAExDhvZzPfH7Z1wNm_t7cQzrYhcZZqKAe8-3mU6s6=H_purjOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 29, 2012 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Ok, so your suggestion is to just maintain the AVR32 support in
> Buildroot as is, and not spend time improving it. Is that correct?
>

Actually I was trying not to suggest that, while trying to inform of
my past experience that might help somehow. I had edited the message a
few times before sending :)

Clearly there are still users, I don't feel it's right by them for me
to suggest that, but I don't know what the policy will be on this
case. I mean, gcc patches probably will not be accepted mainstream,
and I have a hard time believing someone will put in the effort after
Atmel droped the ball. It's also not realistic to expect buildroot, qt
or the kernel to carry that support indefinetly.

So, I guess what I'm saying is: I'm sure we would all appreciate if
the support can be improved, but if it's not possible, at least kept
for a while.

Althought you haven't said it, I believe you wish to drop the old gcc
options, and the avr32 toolchain is in the way.
