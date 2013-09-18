From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 14:46:13 -0300
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <20130918194042.302e9afe@skate>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
 <20130918183414.45e6a247@skate>
 <CAAXf6LWmH2xtBe_P-P+1HJhndDM1BhHZcgJzu9o7JrfwjtwWVg@mail.gmail.com>
 <20130918194042.302e9afe@skate>
Message-ID: <5239E6E5.4000401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/2013 02:40 PM, Thomas Petazzoni wrote:

> The situation definitely needs to be clarified. We have gradually
> changed the semantic of BR2_PREFER_STATIC_LIB from "prefer static
> libraries" (which doesn't make any sense: you were getting static
> libraries for some packages, dynamic for some others) to "use only
> static libraries".

I think it's time to rename it to BR2_BUILD_STATIC or similar.
Who wants to take this one up? It shouldn't be hard.
Regards.
