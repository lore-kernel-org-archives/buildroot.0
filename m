From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jan 2012 15:45:50 +0100
Subject: [Buildroot] __tls_get_addr compilation issue
In-Reply-To: <CAOrAeon=h3sVxakTz9P3FT7VuvHuHO2_sLZ+Dgxi7+EHrXsSrw@mail.gmail.com>
 (vbr vbr's message of "Mon, 16 Jan 2012 16:00:26 -0800")
References: <CAOrAeo=gMDLMBaHrTaxWa0z98Ym_kt-DpVOzSZc5W3XPEdzyCg@mail.gmail.com>
 <CAOrAeon=h3sVxakTz9P3FT7VuvHuHO2_sLZ+Dgxi7+EHrXsSrw@mail.gmail.com>
Message-ID: <87pqeipeu9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "vbr" == vbr vbr <vvvg77@gmail.com> writes:

 vbr> In case someone else hits this, I worked around the problem by disabling tls
 vbr> when compiling gcc. This is from crosstool ng config:

 vbr> grep disable .config
 vbr> CT_CC_EXTRA_CONFIG_ARRAY="--disable-tls"

Maybe we should make the BR2_GCC_ENABLE_TLS option we have for internal
toolchains available for ctng as well.

-- 
Bye, Peter Korsgaard
