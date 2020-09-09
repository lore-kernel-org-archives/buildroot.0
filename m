From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 9 Sep 2020 11:45:21 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/boost: bump to version 1.74.0
In-Reply-To: <20200909093240.2178664-1-fido_max@inbox.ru>
References: <20200909093240.2178664-1-fido_max@inbox.ru>
Message-ID: <3ee9857d-d7a1-2404-41a3-d9d1f1dd4ec3@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 09.09.2020 11:32, Maxim Kochetkov via buildroot wrote:
> gcc 10 C++20 breaks boost library due to allocator changes.
> https://github.com/boostorg/bimap/issues/23
>
> We need boost 1.74.0 to fix build with gcc 10
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Tested-by: Michael Nosthoff <buildroot@heine.tech>? for arm
cortex-a15/gcc9/glibc
