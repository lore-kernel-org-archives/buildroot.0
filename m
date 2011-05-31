From: Daniel Mack <zonque@gmail.com>
Date: Tue, 31 May 2011 18:18:13 +0200
Subject: [Buildroot] [PATCH 1/2] Add package acl
In-Reply-To: <20110531074715.Horde.sKpzOGms4ABN5ONTHDNzy_A@www.home.zuerker.org>
References: <1306779390-19947-1-git-send-email-zonque@gmail.com>
	<1306779390-19947-2-git-send-email-zonque@gmail.com>
	<20110530210244.5bd309aa@surf>
	<BANLkTikqvZ9iJTvg7QC7WDOUKX+F9KyK0g@mail.gmail.com>
	<20110531074715.Horde.sKpzOGms4ABN5ONTHDNzy_A@www.home.zuerker.org>
Message-ID: <BANLkTimadQbnqUbyK8U9j_ad43X8m8SWLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 31, 2011 at 2:47 PM, Heiko Zuerker <heiko@zuerker.org> wrote:
>>> Any reason to not use the default "make install" behaviour of the
>>> package ? (And ditto for the attr package).
>>
>> The libtool crap failed for cross compilation in these cases, so these
>> workarounds are unfortunately necessary.
>
> Actually this isn't necessary, please see my version of the patches.

Hmm, ok. Let's bring your patches mainline then, and I'll test again later.

Thanks,
Daniel
