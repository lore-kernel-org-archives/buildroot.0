From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:39:01 +0200
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <20170320225250.0a5bd659@free-electrons.com>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
 <20170320225250.0a5bd659@free-electrons.com>
Message-ID: <20170401183901.3655ba77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 22:52:50 +0100, Thomas Petazzoni wrote:

> On Tue, 20 Dec 2016 14:46:28 +0100, J?r?me Pouiller wrote:
> 
> > libtool include support for cross-compilation since v1.5.  
> 
> Are you sure this is true?
> 
> In the release notes of libtool v2.4
> (https://savannah.gnu.org/forum/forum.php?forum_id=6525), I see:

So, because of this issue, I've marked patches 11 to 19 from your
series as "Changes Requested". Things are indeed not as simple as "use
sysroot support from libtool".

Of course, it would definitely be nice to continue working on this
topic, and benefit from libtool sysroot support when available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
