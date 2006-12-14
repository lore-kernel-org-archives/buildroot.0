From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 14 Dec 2006 15:57:38 +0100
Subject: [Buildroot] FTP server for embedded application
	(uClibc/buildroot)
In-Reply-To: <4581501E.6080501@elaxys.com.br>
References: <4581501E.6080501@elaxys.com.br>
Message-ID: <1166108258.45816662218c4@imp6-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Claudio,

I'm using pure-ftpd and it's working fine for me (but it's not the smallest
existing one).

Here is a preliminary patch I wanted to post on buildroot mailing list.
Could you give it a try and help me to integrate it in buildroot ?

Thanks !
Julien

Quoting Claudio Leonel <cls@elaxys.com.br>:

> Hi,
>
> Sorry if this is somewhat off-topic,
> but I am looking for a small FTP server
> with basic functionality that compiles OK
> with uClibc and has very few dependencies on
> other libraries.
> I didn't find any in buildroot standard
> packages.
> Do you have sugestions ?
>
> Best regards,
> Claudio Leonel
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: pure-ftpd.diff
Type: text/x-patch
Size: 5608 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061214/9d138b04/attachment.bin 
