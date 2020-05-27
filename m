From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 27 May 2020 12:27:17 +0200
Subject: [Buildroot] [for-next] package/rust: allow using python3
 interpreter
In-Reply-To: <20200526182037.592824-1-romain.naour@gmail.com>
References: <20200526182037.592824-1-romain.naour@gmail.com>
Message-ID: <3cc18038-f599-3ebe-13cc-09140296513d@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain and all,
On 26/05/20 20:20, Romain Naour wrote:
> Fedora packaging use python3 as python interpreter since rust 1.24.0 [1]
> by removing python2 tests from configure script [2].
> 
> Using python3 will help to remove python2 in a near future.
> 
> [1] https://src.fedoraproject.org/rpms/rust/c/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2
> [2] https://src.fedoraproject.org/rpms/rust/blob/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2/f/rust.spec#_314
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Titouan Christophe <titouan.christophe@railnova.eu>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Patrick Havelange <patrick.havelange@essensium.com>

Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>

> ---
>   ...igure-use-default-python-interpreter.patch | 37 +++++++++++++++++++
>   package/rust/rust.mk                          | 17 ++++++---
>   2 files changed, 49 insertions(+), 5 deletions(-)
>   create mode 100644 package/rust/0002-configure-use-default-python-interpreter.patch
> 
