From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:09:06 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/bmap-tools: new package
In-Reply-To: <b58dcdbb343c25cc252ef9249dcd86c7f2aaba50.camel@orolia.com>
References: <20191105125039.1443-1-nicolas.carrier@orolia.com>
 <20200903204403.72304c2d@windsurf.home>
 <b58dcdbb343c25cc252ef9249dcd86c7f2aaba50.camel@orolia.com>
Message-ID: <20200904090906.74a24cb5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 04 Sep 2020 08:39:58 +0200
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Thank you very much for the notice, I'll take a look, this patch is
> starting to get quite old :)
> 
> I missed Romain's comments, because the mails for patches I have been
> working on, are drowned into the rest of the ML's messages.
> It's really by luck that I noticed this one :)
> 
> I'll try to configure some filtering in by email client, but is there
> some setup option to get only emails for patch series I'm working on?
> The Ml's volume is way to high for me to follow the pace :/

You're probably not filtering e-mails the correct way. To filter
e-mails from the mailing list, you should filter them based on the
"List-Id" header.

If you do that, all the mailing list traffic will go to your
"buildroot" e-mail folder. But if you're explicitly Cc'ed on an e-mail
(which is the case here), you will receive it in your Inbox. This
allows to nicely split the "general mailing list traffic" from "the
specific things on which your input is needed".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
