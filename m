From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 17:50:45 +0400
Subject: [Buildroot] util-linux version update 2.22.1
In-Reply-To: <5076CD9E.9000307@zacarias.com.ar>
References: <1349961942.28555.1.camel@localhost>
 <5076CD9E.9000307@zacarias.com.ar>
Message-ID: <1349963445.28555.4.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? ??., 11/10/2012 ? 10:46 -0300, Gustavo Zacarias ?????:
> On 10/11/12 10:25, Alexander Khryukin wrote:
> 
> > Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
> 
> NAK, PAM is mandatory for >2.20.1
> Regards.
> 
> 

I can comile util-linux 2.22.1 with

        $(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),,--disable-login) \
        $(if $(BR2_PACKAGE_UTIL_LINUX_SU),,--disable-su)
