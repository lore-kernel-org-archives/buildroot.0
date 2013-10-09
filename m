From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 9 Oct 2013 14:08:29 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <20131009134355.44ae2733@skate>
References: <4FCD4B90.3020007@mind.be>
 <1381311986-11533-1-git-send-email-alvaro.gamez@hazent.com>
 <20131009134355.44ae2733@skate>
Message-ID: <CAM+bi4vJbFEGdDKMjJxesqR8T=g=KQkgeZpaLNy=1L_FsDkrPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!


2013/10/9 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> It would be good to use a number in the patch file names, such as:
>
>         libxmlrpc-01-<something>.patch
>         libxmlrpc-02-<somethingelse>.patch
>

In this case, the order doesn't matter, but will do anyway

> +#############################################################

Those lines should have 80 #
>

Done.


> One empty line between the header and the first variable.
>

And done.


> Can you add LIBXMLRPC_LICENSE and LIBXMLRPC_LICENSE_FILES ?
>

Done, although it's not perfect, there are three different licenses, two of
them bsd like... it's a bit confusing.


>   > +define LIBXMLRPC_REMOVE_DEVFILE
> > +     $(RM) $(TARGET_DIR)/usr/bin/xmlrpc-c-config
> > +endef
>
> Hum, maybe this should use the <pkg>_CONFIG_SCRIPTS mechanism instead
> (if xmlrpc-c-config is a shell script).
>

Yes, it is much cleaner now.

I'm sending the new patch right now

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/0ecef81e/attachment-0001.html>
