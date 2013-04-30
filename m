From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 30 Apr 2013 07:36:54 +0100
Subject: [Buildroot] [PATCH] libjson: new package
In-Reply-To: <8761z53vm4.fsf@dell.be.48ers.dk>
References: <1364416080-10797-1-git-send-email-spdawson@gmail.com>
 <8761z53vm4.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCPWgerWqrvKqVhW9rJPVWaquRwdzwWjyW8zKPG0N-psnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29 April 2013 21:55, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
>
>  spdawson> From: Simon Dawson <spdawson@gmail.com>
>  spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
>  spdawson> ---
>  spdawson>  package/Config.in                                  |    1 +
>  spdawson>  package/libjson/Config.in                          |   11 ++++
>  spdawson>  .../libjson/libjson-0001-fix-broken-makefile.patch |   16 ++++++
>  spdawson>  package/libjson/libjson.mk                         |   53 ++++++++++++++++++++
>  spdawson>  4 files changed, 81 insertions(+)
>  spdawson>  create mode 100644 package/libjson/Config.in
>  spdawson>  create mode 100644 package/libjson/libjson-0001-fix-broken-makefile.patch
>  spdawson>  create mode 100644 package/libjson/libjson.mk
>
> Committed with some modifications (see below) - Thanks.

Thanks for your help with this Peter.

Simon.
