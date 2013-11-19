From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Mon, 18 Nov 2013 17:55:38 -0800
Subject: [Buildroot] [PATCH 1/1] dbus-python: select pyexpat dependency
In-Reply-To: <20131119003245.29a4eb69@skate>
References: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
 <CAPyrzo1JdOBrWPbDR3-B5CJXQi0O5nGoK_HQOQv6rWNYAMhJqg@mail.gmail.com>
 <20131119003245.29a4eb69@skate>
Message-ID: <CAPyrzo3OyL8+macM-9nwjvo=6YpC=3WMggkWAWZFPPnj+VkD=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think it had to do with adding --compose to git send-email. I had
specified the path of the patch as well, but now I see it wanted to split
it up into separate emails -- one with my composed message explaining the
patch[set] and one for each of the attached patches. Makes sense now.

I see -- I will add the runtime dependency comment and resubmit here.

Thanks,
~vsergeev
Ivan Sergeev


On Mon, Nov 18, 2013 at 3:32 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Ivan Sergeev,
>
> On Mon, 18 Nov 2013 14:37:59 -0800, Ivan Sergeev wrote:
>
> > For some reason git send-email didn't attach the patch. I've attached it
> > here.
>
> git send-email never "attaches" the patch. It sends the patch inline,
> so that reviewers can hit "reply" and review your patch directly by
> replying to the e-mail.
>
> I think your patch is good, but you should add a comment above the new
> select line to indicate that it is a runtime dependency only (which
> explains why you're changing the Config.in only, and not the .mk file).
> Something like:
>
>         # Runtime dependency only
>         select BR2_PACKAGE...
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131118/4fdcc091/attachment.html>
