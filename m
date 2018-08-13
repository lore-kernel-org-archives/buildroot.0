From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 14:54:53 -0700
Subject: [Buildroot] [RFC PATCH 2/2] perl-xml-parser: new package
In-Reply-To: <20180813230517.189c07a5@windsurf>
References: <20180813175645.11088-1-chrismcc@gmail.com>
 <20180813175645.11088-3-chrismcc@gmail.com>
 <20180813230517.189c07a5@windsurf>
Message-ID: <CALURroSEVWxLonUxH-JGsCO+g+mhVYhT+=Nty7-6P5_uOYCJBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On Mon, Aug 13, 2018, 2:05 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Mon, 13 Aug 2018 10:56:45 -0700, Christopher McCrory wrote:
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>
> This seems to be a partial patch.
>
> Your patch series seems a bit messed up. You have sent:
>
>   RFC PATCH 0/2
>   RFC PATCH 1/2
>   RFC PATCH 2/2 (this patch, which is partial)
>   RFC PATCH 4/4
>
> Could you fix this up and send a proper patch series ? If you're not
> familiar yet with git send-email, I would suggest that you send your
> patch series to yourself first, to make sure everything is correct,
> before sending them to the Buildroot mailing list.
>
> On phone so formatting might be off. And I'm a little buzzed.
>

I had a mistake in that package and git reverted to re gen the commit, and
forgot the git add afterwards. I can regen, but is the whole sed thing the
way to deal with this quirk?  Is there a better way that I am missing?
Hense the -- rfc.

And thank you for dealing with the whole Buildroot project.




>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180813/c1f7095a/attachment.html>
