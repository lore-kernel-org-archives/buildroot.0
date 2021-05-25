From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 May 2021 20:01:47 +0300
Subject: [Buildroot] [PATCH] package/grpc: restrict host-grpc to the
 absolute minimum
In-Reply-To: <20210525165602.18943-1-patrickdepinguin@gmail.com>
References: <20210525165602.18943-1-patrickdepinguin@gmail.com>
Message-ID: <87a6oiu4qs.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 25 2021, Thomas De Schampheleire wrote:
> @@ -20,10 +19,9 @@ config BR2_PACKAGE_GRPC
>  
>  	  http://github.com/grpc/grpc
>  
> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
> +comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.99"

Extra '9' here.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
