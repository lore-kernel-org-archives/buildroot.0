From: Alexander Dahl <post@lespocky.de>
Date: Wed, 17 Feb 2021 16:52:35 +0100
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
 <20210216000715.2d81f552@gmx.net>
 <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
Message-ID: <20210217155233.3yf2tjemg3mygcm7@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Wed, Feb 17, 2021 at 09:20:03AM -0500, mattwood2000 at gmail.com wrote:
> Well, that sounded like a great solution but unfortunately the
> buildroot still tries to build within the <PKG>_SUBDIR.  The main
> issue is Amazon's rule to disallow in-source building, even within a
> separate directory.  I worked around this by not including their
> iterate function to detect an in-source build and using
> SUPPORTS_IN_SOURCE_BUILD=NO.

Just out of curiousity: why would you want to build in source anyways?
Why not build out of source as usually recommended and first class
supported by CMake?

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210217/2897d884/attachment.asc>
