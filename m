From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 22:29:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/cli11: new package
In-Reply-To: <20200727193329.GK19818@scaer>
References: <20200706111715.46462-1-aleksandr.o.makarov@gmail.com>
 <20200727212345.2d650692@windsurf.home>
 <20200727193329.GK19818@scaer>
Message-ID: <20200727222920.51f0cda0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 21:33:29 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yes: the header is not versionned. So if we update, we'll end up with
> another CLI11.hpp which content is different.

That is indeed a very good argument. OK, I'll apply Aleksandr's package
then.

Thanks for the feedback.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
