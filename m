From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 01 Nov 2006 08:27:24 -0700
Subject: [Buildroot] update to newer openssl and openssh?
In-Reply-To: <ecb4efd10610311716t17f73770g4b4b5e041006cb88@mail.gmail.com>
References: <ecb4efd10610311716t17f73770g4b4b5e041006cb88@mail.gmail.com>
Message-ID: <1162394844.2945.6.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2006-10-31 at 20:16 -0500, Clem Taylor wrote:
> I was wondering if there is a reason why the openssl in buildroot is
> so old? buildroot-svn is using 0.9.7e (Oct 25, 2004) and the latest
> version 0.9.8d (Sept 28, 2006). Likewise openssh 3.9p1 and the latest
> is 4.4p1 (Sept 27, 2006). It would seem that you would want to keep
> something like this fairly current.

All it takes is a patch bumping the version in
package/openssl/openssl.mk. You can email it to the mailing list or use
http://bugs.uclibc.org/.

-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
