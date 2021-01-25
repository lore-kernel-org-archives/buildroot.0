From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:37:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: resolve uboot env
 source file error
In-Reply-To: <CANQCQpbmPKCP74bEZHfcAxL33j+ATmgOe6m4eMPQRKS=9A=3hA@mail.gmail.com>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125221537.5cb4dbdd@windsurf.home>
 <CANQCQpbmPKCP74bEZHfcAxL33j+ATmgOe6m4eMPQRKS=9A=3hA@mail.gmail.com>
Message-ID: <20210125223742.471561e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 15:30:42 -0600
Matthew Weber <matthew.weber@collins.com> wrote:

> > Applied to master, thanks. I think this bug really shows we need some
> > unit tests for this uboot-tools package functionality, in
> > supporting/testing/.  
> 
> I did add autobuilder testing of this feature but it didn't do a case
> for when the file isn't provided....
> https://github.com/buildroot/buildroot/blob/master/utils/genrandconfig#L304

I think this sort of feature gets better tested by specific targeted
tests in support/testing/.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
