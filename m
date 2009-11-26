From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Thu, 26 Nov 2009 09:30:24 -0500
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <20091125222504.5aa3b23d@surf>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<20091125222504.5aa3b23d@surf>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAE7bH9cGX9lJvelAwnTnzMABAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,



-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
la part de Thomas Petazzoni
Envoy??: 25 novembre 2009 16:25
??: buildroot at busybox.net
Objet?: Re: [Buildroot] jffs2 multiple partition

Le Wed, 25 Nov 2009 11:08:07 -0500,
"Jonathan dumaresq" <jdumaresq@cimeq.qc.ca> a ?crit :

> I work with the atngw100 board and I try to build my custom linux fs
> with buildroot. I try to figure out how to split the rootfs in 2
> partitions. 

How would like to split the rootfs ?
 I.e, what should Buildroot do to
split your rootfs ? What should be in the two different parts ?

I use the atngw100 board from atmel and We have 8M of parrallel flash and 8M
of serial flash. If the rootfs is > 8MB, I need to split the the rootfs. I
have looked in the ATMEL buildroot and from what I see, HCE have done some
work to ba able to do it. I just finished to port his work on my upstream
version of buildroot. 

The main idea is to put the usr part in the 8MB serial flash. 

I don't know if this is something that buildroot should offer ? if yes, I
can try to make a patch that add this functionality to buildroot ?

Jonathan
