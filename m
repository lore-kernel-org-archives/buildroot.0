From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 May 2014 07:06:08 -0300
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <20140526113840.3473ed77@free-electrons.com>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>	<1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
 <20140526113840.3473ed77@free-electrons.com>
Message-ID: <53831210.40406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2014 06:38 AM, Thomas Petazzoni wrote:

> No, we want to install .a files as well in my opinion. In fact, the
> patch series I have to rename BR2_PREFER_STATIC_LIB makes things even
> clearer, with three possibilities: pure static, static and shared, pure
> shared.

Sorry but i didn't see your patchset so relax a bit :)
That being said do we really want a pure dyn scenario? Since we purge .a
files from the target anyway since they're not required for runtime it
wouldn't hurt a bit to keep the dual mode and just static i think.
Regards.
