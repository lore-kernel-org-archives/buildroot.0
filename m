From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 09:51:06 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 26 Feb 2017 23:42:47 +0100")
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <874lzelmv9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > cmake-3.7 has a bug in how it handles rpath, linking with libraries from
 > the host.

 > Until we completely understand the issue, just blacklist cmake-3.7.

 > The issue has been reported upstream:
 >     http://public.kitware.com/pipermail/cmake/2017-February/064970.html

It is a bit painful that we are back to always building cmake on modern
distributions, but OK - Correctness is more important.

Committed, thanks.

-- 
Bye, Peter Korsgaard
