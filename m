From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Apr 2020 07:18:29 +0200
Subject: [Buildroot] [PATCH 1/2] linux: do not install images in
 subdirectories
In-Reply-To: <877dyx7cfy.fsf@dell.be.48ers.dk>
References: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com>
 <877dyx7cfy.fsf@dell.be.48ers.dk>
Message-ID: <20200403071829.5711a113@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 03 Apr 2020 00:25:05 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > Except that the line:  
> 
>  >   $(INSTALL) -m 0644 -D $(LINUX_IMAGE_PATH) $(1)/$(notdir $(LINUX_IMAGE_NAME))  
> 
> This is a bit confusing, as it is because notdir was NOT used that it
> didn't work, so I've dropped that from the commit message and committed,
> thanks.

Gah, indeed, I copy/pasted the line after having done my change. Stupid
me. Thanks for noticing and fixing this!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
