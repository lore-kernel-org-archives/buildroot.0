From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 1 Dec 2011 09:03:08 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <000f01ccb039$aceba2d0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111201091152.68aa9433 @skate>
 <000f01ccb039$aceba2d0$0400a8c0@dspcgrnzks9p98>
Message-ID: <201112010903.10324.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 1 2011, Jeff Krasky wrote:
> > No, the patch is in an e-mail I have sent to the list yesterday evening.
> 
> Ok, so I go to the email with a subject of "[Buildroot] [PATCH 1/1]
> igh-ethercat: new package" and I copy the text from
> 

You don't even have to do that, just save the e-mail as a plain text
file using your e-mail client.

Patch will ignore the leading, non-patch, discussion.

It was designed that way, back in the days when the only way to
pass patches was by e-mail.  ;-)

Mike
> 
> 
> ---
>  package/Config.in                    |    1 +
>  package/igh-ethercat/Config.in       |   23 +++++++++++++++++++++++
> 
> 
> 
> 
> all the way down to the text
> 
> 
> 
> 
> +IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
> +
> +$(eval $(call AUTOTARGETS))
> \ No newline at end of file
> --
> 1.7.4.1
> 
> 
> 
> and place it in a text file called filename.patch.  Then I go into the
> directory buildroot-2011.11 and I run 'cat filename.patch | patch -p1'
> 
> Then I can just run 'make menuconfig', 'make', etc?
> 
> Thanks so much.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
