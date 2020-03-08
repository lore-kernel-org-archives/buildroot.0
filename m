From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 16:21:06 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/bearssl: new package
In-Reply-To: <20200227163042.3723042-1-fontaine.fabrice@gmail.com>
References: <20200227163042.3723042-1-fontaine.fabrice@gmail.com>
Message-ID: <20200308162106.706e131f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 17:30:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written
> in C
> 
> https://bearssl.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/bearssl/Config.in    |  7 +++++++
>  package/bearssl/bearssl.hash |  3 +++
>  package/bearssl/bearssl.mk   | 39 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/bearssl/Config.in
>  create mode 100644 package/bearssl/bearssl.hash
>  create mode 100644 package/bearssl/bearssl.mk

I did a few tweaks to the .mk file, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
