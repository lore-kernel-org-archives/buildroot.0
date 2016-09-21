From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 21 Sep 2016 10:37:26 +0200
Subject: [Buildroot] Improved patches for Arietta G25 and Aria G25 boards
In-Reply-To: <20160920141130.4d56279b@free-electrons.com>
References: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
 <CA+TH9VnFhhz5mG9POQ4JdamrqEkFia1e=SU=vr1b5_QDD7r8Wg@mail.gmail.com>
 <20160920120911.695c6a20@free-electrons.com>
 <CA+TH9VkNNZKq--XNUO6u9Yh2=L9J+E7jZjrS7x8GY=nu+=UHKA@mail.gmail.com>
 <20160920141130.4d56279b@free-electrons.com>
Message-ID: <CAJkBjxFEyH6ZftWFSVa9UuL-sv-DoqQ=_FEDEik-BoH1TLOmYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
In the next patches that I will send, I have used the official repository
for at91bootstrap (i.e https://github.com/linux4sam/at91bootstrap) since it
includes the patches I have sent to update at91bootsrtap configuration for
Acme Systems boards (Arietta, Aria and Acqua).
I think that the at91bootstrap package should be updated to 3.8.6 version
which is the lastest version.
In the previous patches that I sent, I have changed to my own Github
repository for at91bootstrap because when I tried to compile the
at91bootstrap of Tanzilli's repo I got some errors and I noticed that the
configuration for Acme Systems boards had to be updated. For this reason, I
cloned the official at91bootstrap repo (i.e the official Atmel repo which
also included an old configuration for Acme Systems boards) and I have
updated the configuration of Arietta, Aria and Acqua boards since new
configuration options were added and some old ones were been removed. You
can see the changes in my at91bootstrap github repo.
I have also make a post in the acmesystems google group to explain the
changes I introduced in at91bootstrap and I have also sent an email to
Sergio Tanzilli to inform it about the new version of At91bootstrap but I
haven't received a reply yet.
I will also make a pull request to the Tanzilli's repo.

2016-09-20 14:11 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 20 Sep 2016 12:15:15 +0200, Angelo Compagnucci wrote:
>
> > Biagio changed the repository for at91bootstrap to his own fork. I would
> > really prefer to have all related Acmesystems patches into the Tanzilli's
> > repo cause he is the maintainer for his own products patches.
>
> Ah, yes, indeed. Please use the "reference" Github repository.
>
> Biagio, why did you change to your own Github repository for
> at91bootstrap ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160921/0f0a718a/attachment.html>
