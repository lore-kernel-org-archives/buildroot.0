From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 22:49:39 +0100
Subject: [Buildroot] [PATCH 1/1] new package: libfribidi
In-Reply-To: <1356507838-9090-1-git-send-email-mikhailboiko85@gmail.com>
 (Mikhail Boiko's message of "Wed, 26 Dec 2012 09:43:58 +0200")
References: <1356507838-9090-1-git-send-email-mikhailboiko85@gmail.com>
Message-ID: <87ehhzi9l8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mikhail" == Mikhail Boiko <mikhailboiko85@gmail.com> writes:

 Mikhail> Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
 Mikhail> ---
 Mikhail>  package/Config.in                |    1 +
 Mikhail>  package/libfribidi/Config.in     |    7 +++++++
 Mikhail>  package/libfribidi/libfribidi.mk |   13 +++++++++++++
 Mikhail>  3 files changed, 21 insertions(+)
 Mikhail>  create mode 100644 package/libfribidi/Config.in
 Mikhail>  create mode 100644 package/libfribidi/libfribidi.mk

 Mikhail> diff --git a/package/Config.in b/package/Config.in
 Mikhail> index 3d556b2..e60f22e 100644
 Mikhail> --- a/package/Config.in
 Mikhail> +++ b/package/Config.in
 Mikhail> @@ -519,6 +519,7 @@ source "package/libelf/Config.in"
 Mikhail>  source "package/libevent/Config.in"
 Mikhail>  source "package/libev/Config.in"
 Mikhail>  source "package/libffi/Config.in"
 Mikhail> +source "package/libfribidi/Config.in"

As it deals with text I think it makes more sense to put it under 'Text
and terminal handling. Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
