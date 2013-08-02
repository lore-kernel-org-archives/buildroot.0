From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 02 Aug 2013 10:10:23 +0200
Subject: [Buildroot] =?utf-8?q?List_of_pending_patches=3A_what_to_do=3F?=
In-Reply-To: <20130731191415.545f7dff@skate>
References: <20130731191415.545f7dff@skate>
Message-ID: <7fe2477af11648354240d88580f0badc@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 2013-07-31 19:14, Thomas Petazzoni wrote:
[...]
> http://patchwork.ozlabs.org/patch/219795 lxc: new package
Not intrusive and works for me. Let's see if autobuilder throw 
anything.

[...]
> http://patchwork.ozlabs.org/patch/243426 Fix bug with dependencies of 
> *-rebuild and *-reconfigure
There is another discussion thread about this patch (I am also in favor
of its integration).

> http://patchwork.ozlabs.org/patch/243427 [v2] Add support for plain 
> URL in $(PKG)_PATCH variable
Hmmm... reviewed by Yann and Markos. Could be merged, isn't?

[...]
> http://patchwork.ozlabs.org/patch/243725 Standardisation of 
> $(BUILD)/.root name
I have to send a last update of this patch


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
