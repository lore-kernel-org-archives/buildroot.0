From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 03 Jan 2014 10:01:03 +0100
Subject: [Buildroot] [PATCH v2] apitrace: new package
In-Reply-To: <52C5E626.7050903@trzebnica.net>
References: <1388698061-32942-1-git-send-email-jezz@sysmic.org>
 <52C5E626.7050903@trzebnica.net>
Message-ID: <1980406.FpqFHcLL6B@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jerzy,

On Thu 02 Jan 2014 23:20:22 Jerzy Grzegorek wrote:
> Hi J?r?me,
[...]
> > +APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
> > +APITRACE_SITE =
> > http://github.com/apitrace/apitrace/tarball/$(APITRACE_VERSION)
> I think, we should use github download helper
> APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))

hmm... This function is not yet included in master branch, is it? Do you think 
I should still base my patch on?

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
