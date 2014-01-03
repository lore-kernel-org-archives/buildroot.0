From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 3 Jan 2014 11:05:51 +0200
Subject: [Buildroot] [PATCH v2] apitrace: new package
In-Reply-To: <1980406.FpqFHcLL6B@sagittae>
References: <1388698061-32942-1-git-send-email-jezz@sysmic.org>
 <52C5E626.7050903@trzebnica.net> <1980406.FpqFHcLL6B@sagittae>
Message-ID: <20140103090551.GP6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Jan 03, 2014 at 10:01:03AM +0100, J?r?me Pouiller wrote:
> On Thu 02 Jan 2014 23:20:22 Jerzy Grzegorek wrote:
> > Hi J?r?me,
> [...]
> > > +APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
> > > +APITRACE_SITE =
> > > http://github.com/apitrace/apitrace/tarball/$(APITRACE_VERSION)
> > I think, we should use github download helper
> > APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
> 
> hmm... This function is not yet included in master branch, is it? Do you think 
> I should still base my patch on?

It's in master branch since commit bb083e95cfae9 (infra: introduce github 
helper function).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
