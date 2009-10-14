From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Wed, 14 Oct 2009 13:07:08 -0700
Subject: [Buildroot] Default target file permissions ?
In-Reply-To: <4AD5F268.5080501@mimc.co.uk>
References: <4AD5F268.5080501@mimc.co.uk>
Message-ID: <4AD62F6C.3020301@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark:

In your Make file for a program, in the install target section you can 
set the file permissions.

Example,

install:
    $(INSTALL) -m -0755 my_program my_install_path

Best Regards,

-- 
Dan Pattison
Ethertek Circuits



Mark Jackson wrote:
> Is it possible to set the default perms for target files / directories ?
>
> I know you can use the "device_table.txt" file, but I'd like *all* my files to
> be (say) 'chmod 755' apart from a few which I already spec via device_table.txt.
>
> Any pointers ?
>
> Thanks
> Mark
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.5.421 / Virus Database: 270.14.16/2435 - Release Date: 10/14/09 06:33:00
>
>   
