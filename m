From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 16:35:22 +0200
Subject: [Buildroot] [PATCH] gcc 4.8.3: add patch for PR60155
In-Reply-To: <53B415CE.5090109@zacarias.com.ar>
References: <1404308617-5370-1-git-send-email-gustavo@zacarias.com.ar>
 <20140702161826.76ea2d0c@free-electrons.com>
 <53B415CE.5090109@zacarias.com.ar>
Message-ID: <20140702163522.3c0f7794@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 02 Jul 2014 11:23:10 -0300, Gustavo Zacarias wrote:

> Yes, gcc 4.9.0 doesn't need it.

Cool.

> IMHO it should have been in 4.8.3 since the bug was resolved in April 4
> and gcc was released on May 22, but i don't know their release policies
> so who knows.

OK.

> Regarding CT-NG that's up to Yann, and yes an exception is in order,
> though if you look at other failures it does affect internal toolchains
> as well so the fix alone will make errors go down albeit not all of them.

Yes, sure. I'll work on the autobuilder exception.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
