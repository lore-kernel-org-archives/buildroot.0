From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 17:28:07 +0200
Subject: [Buildroot] [PATCH 03/83 v2] package/collectd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <20160704151822.GA3549@free.fr> (Yann E. MORIN's message of "Mon, 
 4 Jul 2016 17:18:22 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <46b7f0adce308bf807e169fa8c8348c4f349a4b2.1467624132.git.yann.morin.1998@free.fr>
 <87a8hxe8qd.fsf@dell.be.48ers.dk> <20160704151822.GA3549@free.fr>
Message-ID: <871t39e83c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Which looks sensible to me.
 >> 
 >> With the change we instead have:
 >> 
 >> [ ] collectd  ----

 > You did notice the trailing '---' which means that the menu is empty, I
 > guess? ;-)

Yes. I do find it quite stupid that enter isn't just a no-op when the
option isn't enabled, but I guess that's just kconfig :/

-- 
Venlig hilsen,
Peter Korsgaard 
