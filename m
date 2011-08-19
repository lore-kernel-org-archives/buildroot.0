From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Aug 2011 20:49:22 -0300
Subject: [Buildroot]
 =?utf-8?q?What_happened_to_including_toolchain_in_tar?=
 =?utf-8?q?get=3F?=
In-Reply-To: <000501cc5eba$7f56ba60$7e042f20$@com>
References: <000501cc5eba$7f56ba60$7e042f20$@com>
Message-ID: <8b163baa014f5e496fe6c5ca6a81ebf5@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Aug 2011 22:53:57 +0100, Sam Nazarko wrote:

> Hello,
>
> In 2011.02x it is possible to include the toolchain on the target, 
> but
> this option is not visible in 2011.05. I would like to include the
> gclibc toolchain as I need to do some external compiling. The only
> option I can find that may be related is "Include development files 
> in
> the target system" which is enabled, but still ./configure fails at
> finding GCC.

The option moved.
You need to enable "development files in the target filesystem" (under 
"Build options") and then go to to Package -> Develpment tools and 
select gcc.
Note that this is strictly for internal toolchains at the time.
Regards.
