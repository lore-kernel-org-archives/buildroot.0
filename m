From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 31 Aug 2018 06:30:28 +0300
Subject: [Buildroot] [PATCH 1/1] python-pyzmq: bump to version 17.1.2
In-Reply-To: <20180830190333.27732-1-asafka7@gmail.com>
References: <20180830190333.27732-1-asafka7@gmail.com>
Message-ID: <87sh2vw6uj.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

Asaf Kahlon writes:
> Adjust the first patch to the new version, and remove the second
> patch since it's not needed anymore.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>
> This patch should solve some of the build issues of pyzmq.
> I didn't run it through all configs, but checked locally on some.
> ---
>  ...ldroot-zmq-version-instead-of-detect.patch | 14 ++--
>  ...pile_and_run-with-compile_and_forget.patch | 76 -------------------
>  package/python-pyzmq/python-pyzmq.hash        |  4 +-
>  package/python-pyzmq/python-pyzmq.mk          |  4 +-
>  4 files changed, 11 insertions(+), 87 deletions(-)
>  delete mode 100644 package/python-pyzmq/0002-replace-compile_and_run-with-compile_and_forget.patch
>
> diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
> index cb52eaf6de..90e6f23c65 100644
> --- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
> +++ b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
> @@ -12,22 +12,22 @@ host, possibly returning a wrong version number.
>  Instead of trying to run the compiled test program to get the version
>  dynamically, return the version of the buildroot environment.
>  
> -Written by Michael Rommel, modified for version 16.0.2 by Lionel
> -Flandrin.
> +Written by Michael Rommel, modified for version 17.1.2 by Asaf
> +Kahlon.
>  
> -Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> +Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Please keep existing credit log comment and sign-off. You should add
your sign-off below the existing one.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
