From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 14:42:57 +0200
Subject: [Buildroot] package/boost: Optimization is always -O3
In-Reply-To: <58-5f2aa600-1-33499300@111825754>
References: <20200804233128.459253b8@windsurf.home>
 <58-5f2aa600-1-33499300@111825754>
Message-ID: <20200805144257.46e081d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 05 Aug 2020 14:29:49 +0200
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> At first I felt a bit dirty modifying the .jam file but then I found this mail from the
> boost developers who suggest [0] basically that (with a copy of the gcc.jam).
> 
> But even more luckily someone in a reply figured out how to overwrite those
> values using the user-config.jam file [1]. So I have taken this approach.

Yes, I had seen those e-mails. It looks like a good approach.

> I'll submit a patch shortly. Let's see what you think.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
