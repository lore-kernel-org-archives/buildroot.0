From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:18:15 +0100
Subject: [Buildroot] [PATCH 1/1] fix typo for libilclient.so on target
In-Reply-To: <20160208173241.GC3436@free.fr>
References: <1454944884-49410-1-git-send-email-michael.schenk@albistechnologies.com>
 <20160208162945.3a76ee76@free-electrons.com>
 <20160208173241.GC3436@free.fr>
Message-ID: <20160208211815.38390e94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Feb 2016 18:32:41 +0100, Yann E. MORIN wrote:

> > Thanks, I've applied after tweaking two things:
> [--SNIP--]
> >  - The author/SoB lines, where for consistency reasons we prefer to
> >    have the first name before the last name. Yes, I know that depending
> >    on your geographical area, the common way of doing this is
> >    different, but Buildroot Git history uses "FirstName LastName
> >    <email>" everywhere, so I've changed this. If you can change your
> >    Git configuration to use this for future patches, it would be great.
> 
> I beg to disagree here. I amongst all would prefer we do not force
> people to identify one way or another. We should *really* let people
> identify the way *they* want to.

I disagree here. For one, we already force people to use their real
name instead of any pseudonym or fake name. Since we're already asking
them to use their real name for legal reasons (without the real name,
the DCO is moot), then it is not adding much more constraint to require
the naming to follow a certain convention that makes it easier to
identify the contributors.

So, no, we are not going to let people identify the way they want to,
simply because the DCO does not allow that. If you want to do that,
then you should stop asking people to sign-off their patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
