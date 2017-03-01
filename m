From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:46:37 +0100
Subject: [Buildroot] [PATCH next 1/4] glibc: bump default to version 2.24
In-Reply-To: <20170225003448.32459-1-gustavo@zacarias.com.ar>
References: <20170225003448.32459-1-gustavo@zacarias.com.ar>
Message-ID: <20170301224637.0900853c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 21:34:45 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied the entire series to the master branch. On PATCH 3/4
removing glibc 2.22, I've added an entry in Config.in.legacy, like we
normally do when removing gcc/binutils versions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
