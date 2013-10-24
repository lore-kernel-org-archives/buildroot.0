From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Thu, 24 Oct 2013 16:58:05 +0200
Subject: [Buildroot] [PATCH] Rename netkitbase and netkittelnet
In-Reply-To: <20131024153442.56a9157d@skate>
References: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
 <20131024153442.56a9157d@skate>
Message-ID: <CACjG4BKEx1pGoWhDhYhV3ib+gz27rUZpMUwO8VhkOYh0+weROw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2013/10/24 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Both of these packages have been marked deprecated since almost a year
> (November 2013). See 442765fe3d8767956eb26d4bcbaa62ce1e1782ca and
> 5a457ff6cc3129af97f2fdcaa5f88bd5ff02b500.
>
> So many it's simpler better to remove them completely?
>
> Because what your patch is missing is that it's renaming the Config.in
> options for those two packages, but it's not adding the necessary
> compatibility informations in Config.in.legacy. And I don't think it's
> really worth doing that for packages that have been deprecated a year
> ago. What do you think?
>

I didn't notice that. I guess after 1 year the best thing would be to
remove it completely.
Moreover it looks like there is some security issues (
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2004-0911)
that haven't been fixed upstream (last version is from 2000 I think)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131024/760718c8/attachment.html>
