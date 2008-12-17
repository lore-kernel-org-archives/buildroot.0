From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Dec 2008 10:40:02 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/hotplug
In-Reply-To: <20081217063220.1F58D3C682@busybox.net>
References: <20081217063220.1F58D3C682@busybox.net>
Message-ID: <9305ca410812170140r1bf63f0ereb8ad96246740e7b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 17, 2008 at 7:32 AM,  <hamish@uclibc.org> wrote:
> Author: hamish
> Date: 2008-12-16 22:32:19 -0800 (Tue, 16 Dec 2008)
> New Revision: 24436
>
> Log:
> Revert $(strip ...) change which corrupted this file

Argh, sorry about that - Seems like sed went a bit over board :/

-- 
Bye, Peter Korsgaard
