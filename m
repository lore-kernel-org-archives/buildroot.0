From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 22:27:56 +0100
Subject: [Buildroot] [PATCH 3/7] Remove XFree86-Misc (lib & proto) as
 removed from X11R7.5
In-Reply-To: <4BC61636.8050208@gmail.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-4-git-send-email-will_wagner@carallon.com>
	<4BC61636.8050208@gmail.com>
Message-ID: <4BC6335C.3060504@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/2010 20:23, Paulius Zaleckas wrote:
> On 04/14/2010 08:06 PM, Will Wagner wrote:
>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>
> This one is also not removed:
> http://www.x.org/releases/X11R7.5/doc/man/man3/XF86Misc.3.html

Again think the docs are just out of date. Commit to remove it was 
http://cgit.freedesktop.org/xorg/xserver/commit/?id=22e64108ec63ba77779891f8df237913ef9ca731
