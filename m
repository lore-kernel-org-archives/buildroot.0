From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2020 08:43:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/nvidia-driver: fix typos in
 comments
In-Reply-To: <20200830212640.60919-2-iulian.onofrei@yahoo.com>
References: <20200830123610.20164-1-iulian.onofrei@yahoo.com>
 <20200830212640.60919-1-iulian.onofrei@yahoo.com>
 <20200830212640.60919-2-iulian.onofrei@yahoo.com>
Message-ID: <20200831064309.GM14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Iulian, All,

On 2020-08-31 00:26 +0300, Iulian Onofrei spake thusly:
> Signed-off-by: Iulian Onofrei <iulian.onofrei@yahoo.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nvidia-driver/nvidia-driver.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index baf2ba2be5..44e34cb7b4 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -35,7 +35,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>  # NVidia extensions (which is deemed bad now), while the former follows
>  # the newly-introduced vendor-neutral "dispatching" API/ABI:
>  #   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
> -# However, this is not very usefull to us, as we don't support multiple
> +# However, this is not very useful to us, as we don't support multiple
>  # GL providers at the same time on the system, which this proposal is
>  # aimed at supporting.
>  #
> @@ -84,7 +84,7 @@ endef
>  # Those libraries are 'private' libraries requiring an agreement with
>  # NVidia to develop code for those libs. There seems to be no restriction
>  # on using those libraries (e.g. if the user has such an agreement, or
> -# wants to run a third-party program developped under such an agreement).
> +# wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
>  	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
