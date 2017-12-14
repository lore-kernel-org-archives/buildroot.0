From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Thu, 14 Dec 2017 08:06:13 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <CAMbDF3J=j94Ze6LVJWnA7N453JMOP60-SzjLBdrB6n5s_aSkPw@mail.gmail.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
 <20171213182332.GB7364@scaer>
 <20171214071305.33920c54@windsurf.png.is.keysight.com>
 <CAMbDF3J=j94Ze6LVJWnA7N453JMOP60-SzjLBdrB6n5s_aSkPw@mail.gmail.com>
Message-ID: <CAMbDF3KyXg9jP+Mkix9zh5CPNe8e7303RUfLwR1KzKYVqscgYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.12.2017 7:13 vorm. schrieb "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com>:

Hello,

On Wed, 13 Dec 2017 19:23:32 +0100, Yann E. MORIN wrote:

>
> But any case, as you said in a further reply, adding that new option
> does not add much complexity.

But it serves no purpose whatsoever :-)


I disagree with this but maybe it's my electrical engineering background, I
always want full control down to the physical layer.
And mostly there is a use case even if I don't know all of them myself.

I have a question though, is 32k the default uboot environment size? Then I
could also set this as a default. Otherwise again it is a good argument for
keeping the padding option in for debugging  purposes.

Regards
Johannes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171214/a3be6725/attachment.html>
