From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 10:40:10 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F974C3.2020509@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
 <54F974C3.2020509@zacarias.com.ar>
Message-ID: <20150306104010.76c71f6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 06 Mar 2015 06:34:59 -0300, Gustavo Zacarias wrote:

> > I'd say readability. Renaming patches is clearly separated from .mk
> > changes. In the case of your Samba 4.2 bump, the changes within the .mk
> > file are mixed between bump-related changes, and indentation-related
> > changes, and this is what bothers me.
> 
> It doesn't break any bisectability so what's the problem, you don't like
> a patch that changes too many things at once?

Exactly. I'm surprised you even ask, separate logical changes is just
the 101 of open-source contribution in many projects. See
http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L74
for example.

> Sorry to rehash an old thread but this kind of things don't motivate me
> at all.

I don't quite understand your feeling here. What I'm asking you to do
is something we ask to *all* contributors, including newcomers who have
never contributed a single patch to Buildroot. Why would we have more
relaxed/special rules for long-term contributors like you ?

If I was annoying you with something unusual, which I never bother
other people with, I would understand. But here I'm just asking a very
basic thing, which I also ask to every other contributor.

> One thing is when you say "typo" which well, yes, it's a typo and it's
> fine to correct it.

Sorry I did not understand this part.

Anyway, I'll take care of doing the split of the Samba 4.2 patch and
I'll apply. I would have expected a bit more help and understanding from
a long term contributor such as you.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
