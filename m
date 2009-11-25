From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Wed, 25 Nov 2009 11:55:39 -0500
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <200911251044.08107.minimod@morethan.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<200911251044.08107.minimod@morethan.org>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAJxD1r6iG19GkKZkb5E1D8EBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



-----Message d'origine-----
De?: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] De
la part de Michael S. Zick
Envoy??: 25 novembre 2009 11:44
??: buildroot at busybox.net
Objet?: Re: [Buildroot] jffs2 multiple partition


> Is there a way to it it ? Or I must hack the target jffs2 ?
> 

Why not just write the build to a tar-ball?
Untar and divide up however you like before you write the files to jffs2?

Juste looking for an automatic way of doing it. I have check in Atmel
buildroot, and HCE Have modified the jffs2 part to be able to do it. I Just
wonder if the upstream had this possibilities ?

mike
