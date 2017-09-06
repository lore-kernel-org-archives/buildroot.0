From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 14:07:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpng: bump version to 1.6.32
In-Reply-To: <20170902142956.22181-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 2 Sep 2017 16:29:55 +0200")
References: <20170902142956.22181-1-bernd.kuhls@t-online.de>
Message-ID: <87lglsdo8j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added md5 hash provided by upstream.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

It would have been good to mention that this fixes a security issue
introduced in 1.6.31, so a candidate for 2017.08.x:

Vulnerability Warning

libpng version 1.6.31 added png_handle_eXIf(), which has a
null-pointer-dereference bug as well as a potential memory leak. Insofar
as the function has existed for only four weeks and the chunk itself for
only six, it's unlikely there are any applications affected by it at
this time, but they might come into existence in the future. The
vulnerability is fixed in version 1.6.32, released on 24 August 2017.

-- 
Bye, Peter Korsgaard
