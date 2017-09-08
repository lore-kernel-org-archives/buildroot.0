From: Dushara Jayasinghe <nidujay@gmail.com>
Date: Sat, 9 Sep 2017 08:22:35 +1000
Subject: [Buildroot] [PATCH] Add package Prosody
In-Reply-To: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
References: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
Message-ID: <20170908222235.GA18631@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I stuffed it up...

The following was meant to go along with the email:

This is my first use of git send-email so please excuse any
stuff ups.

I'm hoping this will be a reply to 
http://lists.busybox.net/pipermail/buildroot/2017-September/201799.html

Some additional comments:

> * Do you really need Lua 5.1 specifically? Other versions of Lua, or
>   LuaJIT are not suitable ?
 
According to Zach from the prosody dev mailing list, this version of
prosody requires lua 5.1

> * The license information should be more specific than MIT/X11. Is it
>   MIT *or* X11, or a combination of both MIT code and X11 code ? If
>   so, which part is under which license ?
 
This was bit unclear, based on the COPYING file it matches the MIT 
license as specified in Wikipedia, so I'm going with that.
