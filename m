From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Sep 2012 07:33:50 -0300
Subject: [Buildroot] [PATCH] package: add new filesystem utilities
	category
In-Reply-To: <20120913093315.5aa27d5e@skate>
References: <1347490459-4049-1-git-send-email-gustavo@zacarias.com.ar>
 <20120913093315.5aa27d5e@skate>
Message-ID: <5051B68E.3000705@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/13/12 04:33, Thomas Petazzoni wrote:

> mtd is kind of a special case, as it contains both tools for
> manipulating hardware (erasing/reflashing, etc.) and tools to
> manipulate filesystems (JFFS2, UBIFS, etc.), so there's no perfect
> place for it. So:

We could throw in "Block" for good measure and move some more packages
to unload "Hardware", for example mdadm and stuff like that...
Regards.
