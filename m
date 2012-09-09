From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 09 Sep 2012 18:57:10 -0300
Subject: [Buildroot] [PATCH 08/10] mpfr: add license info
In-Reply-To: <87392q3oe7.fsf@macbook.be.48ers.dk>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-8-git-send-email-gustavo@zacarias.com.ar>
 <87392q3oe7.fsf@macbook.be.48ers.dk>
Message-ID: <504D10B6.20607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/09/12 17:57, Peter Korsgaard wrote:

> According to the README and mpfr website the license is simply LGPLv3+,
> but I also see COPYING. Are you sure it is both?

I'm based on the assumption that they're shipping both files(/licenses).
In some cases the library portion is LGPL, for example with gnutls, and
the rest (binary/testcases) remain GPL, though it's unclear for mpfr and
gmp as you say.
I'm just erring on the strict side.
Regards.
