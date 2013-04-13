From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 13 Apr 2013 19:01:31 +0100
Subject: [Buildroot]
	=?buildroot@busybox.net?q?=5BPATCH=20v2=5D=20zeromq=3A=20remove=20libuuid=20dependency?=
In-Reply-To: <CAAHaz6E5UfrGKXU8rn9_AF7p5BF-S9tHSS_jhwdmMo9QudFZLw@mail.gmail.com>
References: <1365663459-3684-1-git-send-email-spdawson@gmail.com>
 <CAAHaz6E5UfrGKXU8rn9_AF7p5BF-S9tHSS_jhwdmMo9QudFZLw@mail.gmail.com>
Message-ID: <CAHt8ZCNNd2iL-BhXG-T0YM_r-ERh3wPRekdCnLbo7ZwH2Rvpkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander; thanks for testing this.

On 12 April 2013 12:08, Alexander Lukichev <alexander.lukichev@gmail.com> wrote:
>   Tested using a Buildroot-generated toolchain of gcc 4.8 with uClibc 0.9.33
> without WCHAR
> (i.e., cc reports wchar_t as an unknown type). The build fails because a
> configure test for C99
> (as well as GNU99) uses wchar_t in a compile-test program

Okay; I'll reinstate the WCHAR dependency for czmq then.

>   Do I need to supply my Buildroot config, czmq config.log and compile
> output?

No, thanks.

>   cppzmq, zmqpp and zeromq appear to have been built OK with this patch.

Okay, thanks.

Simon.
