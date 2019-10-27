From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:17:03 +0100
Subject: [Buildroot] package/alljoyn: is it worth to port to Py3 ?
In-Reply-To: <f26113ff-6b7f-26ac-fc10-a88f4af90132@railnova.eu>
References: <f26113ff-6b7f-26ac-fc10-a88f4af90132@railnova.eu>
Message-ID: <20191027201703.6054e109@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 19:18:55 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Hence my question: is anyone using these alljoyn packages ? There does 
> not seem to be any package that depend on them, and there is no upstream 
> commit since 2016. If nobody needs them, I guess we can simply remove 
> them from Buildroot.

I agree that the Alljoyn stuff seems to be pretty dead upstream, and
that we should probably get rid of them. Fabrice ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
