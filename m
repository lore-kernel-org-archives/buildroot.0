From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 17:18:49 +0200
Subject: [Buildroot] [PATCH 05/83 v2] package/gpsd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <91237ef88ea3f2dab925981525ebe188fd9d44a3.1467624132.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 4 Jul 2016 11:24:16 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <91237ef88ea3f2dab925981525ebe188fd9d44a3.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <8760sle8iu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since there were multiple sub-menus, their prompts are turned into
 > comments.

 > Some option were missing a prompt, so add one; switch integer options to
 > use the 'int' type instead of 'string'. Add separating lines around
 > options.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
