From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 18 Jun 2013 15:05:09 +0100
Subject: [Buildroot] Does MIP64 ABI 64 support dynamic linking?
In-Reply-To: <D4B053F823DA904C8FD129217ABE432D02E4B147C47B@fs28.airspan.com>
References: <D4B053F823DA904C8FD129217ABE432D02E4B147C47B@fs28.airspan.com>
Message-ID: <CAG2jQ8iJ8PxUOrQbiWCuOgptHFq+A7LYVGuO9C+B9P=+MGajXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 April 2013 19:55, Michael Feldman <mfeldman@airspan.com> wrote:
> Hello,
>
>
>
> I built a buildroot MIPS64 BE rootfs for my XLP-based custom board (running
> currently an angstrom-based distribution built with gcc-4.4.5) using last
> version of buildroot.
>
>...
> Has anybody faced this problem and has a hint how to solve it?

Hi Michael,

I believe I've seen this problem once in the past. I did the same
thing like you did. Build a static busybox.

I was wondering if you've managed to debug this problem.

--
Regards,
Markos Chandras
