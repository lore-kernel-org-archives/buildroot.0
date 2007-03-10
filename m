From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Sat, 10 Mar 2007 18:46:12 +0100
Subject: [Buildroot] __cxa_atexit in gcc 3.4.6
In-Reply-To: <20070310160015.5a40c583@lama.infinity.home>
References: <20070310160015.5a40c583@lama.infinity.home>
Message-ID: <20070310184612.14e2331b@lama.infinity.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Mar 2007 16:00:15 +0100
"ing. Federico Fuga" <fuga@studiofuga.com> wrote:

> I have a binary-only library that requires __cxa_atexit
> (it gives me a unresolved symbol error while linking my sources).

I solved the issue, and post the answer for future reference:
the __cxa_atexit is not present in the uClibC 0.9.28.3 but it is in the
snapshot .
It shouldn't be advisable to put a __cxa_atexit patch in the 0.9.28.3 ?

ing. Federico Fuga
