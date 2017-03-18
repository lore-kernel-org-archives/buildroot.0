From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:55:44 +0100
Subject: [Buildroot] [PATCH] libepoxy: reinstate mesa egl cflags patch
In-Reply-To: <20170315132357.2357-1-gustavo@zacarias.com.ar>
References: <20170315132357.2357-1-gustavo@zacarias.com.ar>
Message-ID: <20170318145544.7f10bd63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Mar 2017 10:23:57 -0300, Gustavo Zacarias wrote:
> This is still required when building libepoxy against mesa egl without
> x11 (GL).
> 
> Mesa needs a preprocessor define to avoid including X11 headers and
> since this is not forwarded into epoxy.pc for other
> libraries/applicatons that link against it it will fail.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-Forward-EGL-cflags-into-epoxy.pc.patch    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
