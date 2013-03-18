From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 15:59:28 +0100
Subject: [Buildroot] Problems with zeromq 3.2.2
In-Reply-To: <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
References: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
 <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
Message-ID: <20130318155928.6334b9b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Mon, 18 Mar 2013 14:13:48 +0200, Alexander Lukichev wrote:

>   As I understand, the guide only will not help much in your case
> because you use C++ bindings. That was bundled with zmq-2.x but as
> the library itself is written in C language and the number of other
> language bindings has grown significantly (see the list here
> http://www.zeromq.org/bindings:_start ), C++ bindings were made into a
> separate project, just like other languages.

Why don't we simply create a package for the separate project that
provides the C++ bindings? Do these offer an API that is compatible
with the C++ API that was provided by zmq 2.x?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
