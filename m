From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 10:37:33 +0200
Subject: [Buildroot] [PATCH] expat package : correct install
In-Reply-To: <f0528b5b0706240957r41f3afadt7304199d005a33fd@mail.gmail.com>
References: <f0528b5b0706240957r41f3afadt7304199d005a33fd@mail.gmail.com>
Message-ID: <20070625083733.GB5134@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 24, 2007 at 06:57:32PM +0200, Julien Letessier wrote:
>Install expat cleanly under $(STAGING_DIR)/usr/ and $(TARGET_DIR)/usr/
>instead of $(STAGING_DIR)/ and $(TARGET_DIR)/

Applied. Thanks!
PS: I also changed the touch to $@ since this is less error-prone.
    Also, a CONFIG_UPDATE was missing which i added, so please test if
    this works fine for you.

cheers,
