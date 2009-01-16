From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 07:46:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
In-Reply-To: <87myds6u07.fsf@macbook.be.48ers.dk>
References: <20090113103749.5AC7B76850@busybox.osuosl.org>
	<1232056357.4757.52.camel@aeglos.sweden.atmel.com>
	<87myds6u07.fsf@macbook.be.48ers.dk>
Message-ID: <1232088409.8094.10.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 00:15 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> -$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
>  >> +$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
>  >> -mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
>  >> $(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
>  >> -	touch -c $(TARGET_DIR)/usr/share/fonts/.ttf
>  >> +	touch -c $@
> 
>  Ulf> You *still* put stamp files in the target root file system.
> 
> Huh, $@ look to be
> $(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf, so that's fine.
> 
My mistake, sorry.


-- 
Ulf Samuelsson <ulf.samuelsson@atmel.com>
Atmel Nordic AB
