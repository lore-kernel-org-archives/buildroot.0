From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 22:27:22 +0100
Subject: [Buildroot] [PATCH 2/7] Remove XTrap (app,
 lib & proto) as removed from X11R7.5
In-Reply-To: <4BC61598.8090907@gmail.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-3-git-send-email-will_wagner@carallon.com>
	<4BC61598.8090907@gmail.com>
Message-ID: <4BC6333A.9010705@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/2010 20:20, Paulius Zaleckas wrote:
> On 04/14/2010 08:06 PM, Will Wagner wrote:
>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>
> No, it is not removed, please see documentation:
> http://www.x.org/releases/X11R7.5/doc/man/man1/

I think this is just the documentation not being up to date. According 
to the release notes at http://www.x.org/wiki/Releases/7.5 it is 
removed, and this is the commit that removed it 
http://cgit.freedesktop.org/xorg/xserver/commit/?id=cbc20d92de92aad5ca240310a9156ccf97c24a01
