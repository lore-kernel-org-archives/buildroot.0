From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 28 Aug 2007 15:08:40 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atme	l:	atngw100/target_skeleton	atngw100/target
	etc...
In-Reply-To: <zjt0WVFMP7Qj.yZGl7kFD@mailout.dof.se>
References: <zjt0WVFMP7Qj.yZGl7kFD@mailout.dof.se>
Message-ID: <1188306520.7412.42.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 2007-08-28 at 14:55 +0200, Ulf Samuelsson wrote:
> > Some stuff are needed
> > during the build and
> > the device table is only
> > used when you convert
> > $(TARGET-DIR) to
> > rootfs-avr32.$(fs) which
> > is too late.
> > 
> > It can probably be done
> > better
> 
> Indeed, the packages failing with an "empty" skeleton should have some
> mkdir -p actions in them IMHO. That way not all targets needs to be
> fixed, but just one package.
> 
> => Feel free to provide
>    those patches.

I do whenever I come across them (-:

Are there any specific packages which fails today because of missing
directories?

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
