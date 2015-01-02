From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 19:15:55 +0100
Subject: [Buildroot] [PATCH 3/4] python: bump to 2.7.9
In-Reply-To: <1419800095-7808-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419800095-7808-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150102181555.GI4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-28 21:54 +0100, Thomas Petazzoni spake thusly:
> In addition to doing the bump, this commit also:
> 
>  - Refreshes all the patches
>  - Removes python-003-properly-detect-if-python-build.patch, which has
>    been applied upstream.
>  - Passes the --without-ensurepip option, like is done in Python 3, to
>    avoid having Python use PIP to automatically download stuff when it
>    is being built.
>  - PYTHON_LIBTOOL_PATH = NO is added to prevent Buildroot from trying
>    to patch a version of libtool for which we don't have matching
>    patches, which isn't a problem since we're anyway not using the
>    part of the Python sources that uses libtool (it's the built-in
>    copy of libffi, and we use the external libffi).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[run-time tested to at least print("Hello World\n") properly]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
