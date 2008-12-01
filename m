From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 1 Dec 2008 14:12:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20081201140854.287670ff@surf>
References: <20081201130602.AB0FD3C78E@busybox.net>
	<20081201140854.287670ff@surf>
Message-ID: <20081201141201.507161b7@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 1 Dec 2008 14:08:54 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Mon,  1 Dec 2008 05:06:02 -0800 (PST),
> egtvedt at uclibc.org a ?crit :
> 
> > UTC (rev 24212) @@ -342,8 +342,6 @@ -no-rpath \
> >  		-nomake examples \
> >  		-nomake demos \
> > -		-I $(STAGING_DIR)/usr/include \
> > -		-L $(STAGING_DIR)/usr/lib \
> 
> These lines have been added by me in revision 24001. They are
> necessary to allow compilation with an external toolchain.
> 

Okay, then we'll enable them only if we have an external toolchain.
I'll redo some more in mplayer.mk.

-- 
Best regards,
Hans-Christian Egtvedt
