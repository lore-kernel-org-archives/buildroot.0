From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 10:49:57 +0100
Subject: [Buildroot] How-to export cross-toolchain and libraries to a
 build server?
In-Reply-To: <156048fd0d6d4325bbe2ba0ff5b6e9e0@DB3PR04MB108.eurprd04.prod.outlook.com>
References: <7b2f2b4d2f704f70a128d64f2b6f461f@DB3PR04MB108.eurprd04.prod.outlook.com>
 <20141111102509.56db799d@free-electrons.com>
 <156048fd0d6d4325bbe2ba0ff5b6e9e0@DB3PR04MB108.eurprd04.prod.outlook.com>
Message-ID: <20141111104957.251e3809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabrice Mousset | GEOCEPT GmbH,

On Tue, 11 Nov 2014 09:43:02 +0000, Fabrice Mousset | GEOCEPT GmbH
wrote:

> thanks a lot for your quick reply.
> I will follow your advice and use BR2_HOST_DIR to fixe SDK location.
> So I will have a quick solution to move the SDK to our build server.

Ok. Let us know if that works.

> I will also take a closer look at the TODO list, and perhaps I could contribute to buildroot to help integrating a relocatable SDK generation, which will be a very nice and useful feature.
> But I think, I will have to learn a lot of thinks about the internals of buildroot before.

Sure, your contributions would be very welcome! But indeed, working on
making the SDK relocatable is clearly not the easiest thing to get
started with the Buildroot internals.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
