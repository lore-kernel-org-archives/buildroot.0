From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 17:41:07 +0200
Subject: [Buildroot] [PATCH] download/git: fix trasnform-name
In-Reply-To: <20180407212614.15639-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 7 Apr 2018 23:26:14 +0200")
References: <20180407212614.15639-1-yann.morin.1998@free.fr>
Message-ID: <87muydbt9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When a package contains a relative symlink which first component is '..'
 > (thus pointing one directory higher), for example package 'meh' contains
 > this symlink:

 >     foo/bar -> ../buz

 > then it would be stored as 'meh-version./buz' because of the
 > transform-name pattern replacement.

 > Fix it to only match the leading './'.

 > Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
