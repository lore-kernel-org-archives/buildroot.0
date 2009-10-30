From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 30 Oct 2009 15:13:58 -0400
Subject: [Buildroot] uboot patch
In-Reply-To: <20091030151217.7f8c64f1@surf>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJOyWIY1gOxLoBbCpKpnu5EBAAAAAA==@cimeq.qc.ca>
	<20091030151217.7f8c64f1@surf>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAKUluZon5n1CoPC8yaSeZtIBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
la part de Thomas Petazzoni
Envoy??: 30 octobre 2009 10:12
??: buildroot at busybox.net
Objet?: Re: [Buildroot] uboot patch

Le Fri, 30 Oct 2009 08:50:47 -0400,
"Jonathan dumaresq" <jdumaresq@cimeq.qc.ca> a ?crit :

> I try to figure where I should put my u-boot patch to get them applied
> correctly ?
> 
> I have added my board as per the documentation, now, I try to add my
> custom uboot patch. 

Two solutions:

 1. Add your u-boot patch into your
    target/device/<company>/<board>/u-boot/ directory, and add:

U_BOOT_ARCH_PATCH_DIR:=target/device/<company>/<board>/u-boot

I should put this line in my .config file ? or in my Makefile.in ?

Jonathan
