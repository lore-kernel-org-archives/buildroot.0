From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 08:21:44 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <CAMbDF3KyXg9jP+Mkix9zh5CPNe8e7303RUfLwR1KzKYVqscgYQ@mail.gmail.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
 <20171213182332.GB7364@scaer>
 <20171214071305.33920c54@windsurf.png.is.keysight.com>
 <CAMbDF3J=j94Ze6LVJWnA7N453JMOP60-SzjLBdrB6n5s_aSkPw@mail.gmail.com>
 <CAMbDF3KyXg9jP+Mkix9zh5CPNe8e7303RUfLwR1KzKYVqscgYQ@mail.gmail.com>
Message-ID: <20171214082144.1eef0a4f@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 08:06:13 +0100, Johannes Schmitz wrote:

> I disagree with this but maybe it's my electrical engineering background, I
> always want full control down to the physical layer.
> And mostly there is a use case even if I don't know all of them myself.

If Buildroot starts to support use cases that we don't even understand
when they are needed, then we are going on a very, very slippery road.

> I have a question though, is 32k the default uboot environment size? Then I
> could also set this as a default. Otherwise again it is a good argument for
> keeping the padding option in for debugging  purposes.

No, there is nothing like a default environment size. Each board has
its own value in its U-boot configuration file. 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
