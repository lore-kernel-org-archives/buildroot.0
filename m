From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 25 Nov 2009 10:44:05 -0600
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
Message-ID: <200911251044.08107.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed November 25 2009, Jonathan dumaresq wrote:
> Hi all,
> 
> I work with the atngw100 board and I try to build my custom linux fs with
> buildroot. I try to figure out how to split the rootfs in 2 partitions. 
> 
> Is there a way to it it ? Or I must hack the target jffs2 ?
> 

Why not just write the build to a tar-ball?
Untar and divide up however you like before you write the files to jffs2?

mike
> Regards
> 
> Jonathan
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
