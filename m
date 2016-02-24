From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 24 Feb 2016 20:41:14 +0100
Subject: [Buildroot] Why not perform a shallow clone?
In-Reply-To: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
References: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
Message-ID: <CAHXCMMKHZ0usTWkgfJUbM6P4zLV2ZkAxQB9H9KrTVPar=fMEuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Feb 24, 2016 at 8:30 PM, Patrick Doyle <wpdster@gmail.com> wrote:
> So I'm sitting here watching my buildroot make do a complete clone of
> the Linux kernel, where I have told it that I want a specific sha1
> commit and I started wondering...
>
> Why not do a shallow clone?
It tries, but cannot (see
https://git.buildroot.org/buildroot/tree/support/download/git#n34)

>
> Has it been tried?  Is it a bad idea?
Yes, and no ;-)

Regards,

-- 
Samuel
