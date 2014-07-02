From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 Jul 2014 11:23:10 -0300
Subject: [Buildroot] [PATCH] gcc 4.8.3: add patch for PR60155
In-Reply-To: <20140702161826.76ea2d0c@free-electrons.com>
References: <1404308617-5370-1-git-send-email-gustavo@zacarias.com.ar>
 <20140702161826.76ea2d0c@free-electrons.com>
Message-ID: <53B415CE.5090109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/2014 11:18 AM, Thomas Petazzoni wrote:

> Just to confirm: is it 4.9.0 already?
> 
> Also, it doesn't immediately fix the autobuild issue, because the
> autobuild issue occurs with a pre-built Crosstool-NG toolchain. I'll
> temporarily add an exception in the autobuilders, and then hopefully
> Yann will pick up the patch in Crosstool-NG and at some point we'll be
> able to update the pre-built Crosstool-NG toolchain.
> 
> Thanks a lot for the investigation!
> 
> Thomas

Yes, gcc 4.9.0 doesn't need it.
IMHO it should have been in 4.8.3 since the bug was resolved in April 4
and gcc was released on May 22, but i don't know their release policies
so who knows.
Regarding CT-NG that's up to Yann, and yes an exception is in order,
though if you look at other failures it does affect internal toolchains
as well so the fix alone will make errors go down albeit not all of them.
Regards.
