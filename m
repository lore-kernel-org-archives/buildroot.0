From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:33:03 +0100
Subject: [Buildroot] [PATCH 12/13] screen: bump to version 4.0.3
In-Reply-To: <1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
	<1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20101223083303.07f8a70f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Dec 2010 14:04:33 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../screen/screen-4.0.2-cross_compile_fix.patch    |  524 --------------------
>  package/screen/screen-4.0.2_install-fix.patch      |   21 -
>  package/screen/screen-cross_compile_fix.patch      |  524 ++++++++++++++++++++

I am not terribly happy about this cross_compile_fix patch that
directly hacks the ./configure script.

In bce15df3bea6d1ab4a88db9d31fc2dd30418decc, Nikel Kukard said "The
cross compile fix is unavoidable". But do we have an idea of what the
problem is exactly ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
