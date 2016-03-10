From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 10 Mar 2016 10:31:23 +0100
Subject: [Buildroot] [PATCH 2/8] core/pkg-utils: add a macro to
	pretty-print a help entry
In-Reply-To: <56E0B3AD.2040104@mind.be>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <3c47341f237bad2ed0c674c2ffe1def03a2bdb64.1457561521.git.yann.morin.1998@free.fr>
 <56E0B3AD.2040104@mind.be>
Message-ID: <12788059.xfbTEnnL3q@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Yann,

On Thursday 10 March 2016 00:37:17 Arnout Vandecappelle wrote:
> On 03/09/16 23:22, Yann E. MORIN wrote:
[...]

> > +	for h in $(1); do \
> > +		printf "  %-22s - %s\n" "$${h%% : *}" "$${h#* : }"; \
> > +	done
Personally, I dislike this automatic splitting of argument. Especially,
this macro is not obvious and it may look like black magic.

Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
