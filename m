From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Sep 2012 17:17:35 +0200
Subject: [Buildroot] Google breakpad patch status?
In-Reply-To: <CAJkQPO=cmNHbx088d+7TL+8DQaW64qS9ZhFxFOy=pgSVzWEwEg@mail.gmail.com>
References: <CAJkQPO=cmNHbx088d+7TL+8DQaW64qS9ZhFxFOy=pgSVzWEwEg@mail.gmail.com>
Message-ID: <CAHXCMMKqz5sKtXUZbokBiH03zfkwkpZ5DcE+UdmXAHCEf2mx2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aras, all,

2012/9/5 Aras Vaichas <aras.vaichas@gmail.com>:
> Hi, I was checking to see if Buildroot had Google breakpad. It
> doesn't, but there was a patch for it some months ago:
>
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/34282
>
> ref: http://code.google.com/p/google-breakpad/
Does it provide cross-tools?
Last time I played with it, I could not dump symbol from x86 (32 bits)
binaries using breakpad tools built on x86_64 system. :-/

BTW, breakpad is something like gnulib, a source dependency for
software that want to link against.
Not really easy to package in a distro based on support package
manager; but here, we don't care about this point ;-)


Cheers,


-- 
Sam
