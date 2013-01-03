From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 00:29:13 +0100
Subject: [Buildroot] [PATCH 1/2] libfribidi: new package
In-Reply-To: <CAOWBBJxB8rzAUNJNap5sLQppA68wcBByKZeE=hQK0a267zuQ7Q@mail.gmail.com>
 (Mikhail Boiko's message of "Sun, 23 Dec 2012 23:39:14 +0200")
References: <CAOWBBJxB8rzAUNJNap5sLQppA68wcBByKZeE=hQK0a267zuQ7Q@mail.gmail.com>
Message-ID: <87ip7dong6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mikhail" == Mikhail Boiko <mikhailboiko85@gmail.com> writes:

 Mikhail> ---
 Mikhail> ?package/Config.in ? ? ? ? ? ? ? ?| ? ?1 +
 Mikhail> ?package/libfribidi/Config.in ? ? | ? ?7 +++++++
 Mikhail> ?package/libfribidi/libfribidi.mk | ? 14 ++++++++++++++
 Mikhail> ?3 files changed, 22 insertions(+)
 Mikhail> ?create mode 100644 package/libfribidi/Config.in
 Mikhail> ?create mode 100644 package/libfribidi/libfribidi.mk

 Mikhail> diff --git a/package/Config.in b/package/Config.in
 Mikhail> index 5d9783a..4d45577 100644
 Mikhail> --- a/package/Config.in
 Mikhail> +++ b/package/Config.in
 Mikhail> @@ -496,6 +496,7 @@ source "package/libelf/Config.in"
 Mikhail> ?source "package/libevent/Config.in"
 Mikhail> ?source "package/libev/Config.in"
 Mikhail> ?source "package/libffi/Config.in"
 Mikhail> +source "package/libfribidi/Config.in"
 Mikhail> ?source "package/gsl/Config.in"
 Mikhail> ?source "package/libglib2/Config.in"
 Mikhail> ?source "package/libical/Config.in"
 Mikhail> diff --git a/package/libfribidi/Config.in b/package/libfribidi/Config.in
 Mikhail> new file mode 100644
 Mikhail> index 0000000..11aed62
 Mikhail> --- /dev/null
 Mikhail> +++ b/package/libfribidi/Config.in
 Mikhail> @@ -0,0 +1,7 @@
 Mikhail> +config BR2_PACKAGE_LIBFRIBIDI
 Mikhail> + bool "libfribidi"
 Mikhail> + help
 Mikhail> + ?GNU FriBidi is an implementation of the Unicode?

Trailing space.

Are you sure it doesn't depend on any toolchain features? I would have
expected it to atleast need wchar support.

Care to resend with this fixed and the other things mentioned?
(signed-off-by and license info).

-- 
Bye, Peter Korsgaard
