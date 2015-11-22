From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 22 Nov 2015 08:53:31 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <564F3C6D.8080502@zacarias.com.ar>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
 <564F3C6D.8080502@zacarias.com.ar>
Message-ID: <20151122075330.GP19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,
Gustavo Zacarias wrote,

> On 19/11/15 20:15, Thomas Petazzoni wrote:
> This is in the bag of "arch needs libatomic" together with
> strongswan for microblaze.
> 
> >>sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/8dcf5f73904de835bf66c46747cd544efc9d3a22/
> >
> >undefined reference to `__atomic_fetch_or_4'
> >
> >Waldemar, can you have a look ?
> 
> SPARC (v8, 32 bits) doesn't have atomics at all, libatomic, again
> could fit the bill. It may be inherited from somewhere else like
> boost.

Can you explain this? I can't see any special handling for boost and
atomics in buildroot. Or do you mean how boost handle it atomic
implementation for sparc?

best regards
 Waldemar
