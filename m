From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 22:39:53 +0100
Subject: [Buildroot] [PATCH] freetype: add libpng to freetype-config and
	freetype2.pc
In-Reply-To: <1384092189-4590-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 10 Nov 2013 11:03:09 -0300")
References: <1384092189-4590-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eh6oc4wm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

> Add libpng libraries to freetype-config and freetype2.pc when they're
> needed to avoid build breakage for other packages.

> Patch in a different form is already upstream.

> Fixing configure & friends is not so good since autoreconf busts things
> up because of the odd way things are done (upstream fixed too it seems).

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
