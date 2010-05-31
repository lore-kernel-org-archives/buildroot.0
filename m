From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 31 May 2010 13:54:16 -0500
Subject: [Buildroot] buildroot GPL question
In-Reply-To: <002f01cb00e9$af8f1180$0ead3480$@com>
References: <002f01cb00e9$af8f1180$0ead3480$@com>
Message-ID: <201005311354.19024.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon May 31 2010, Andrei Costin (lists) wrote:
> Hi,
> 
>  
> 
> I would like someone's advise for the course of action regarding a vendor
> that used _buildroot_  to compile an embedded linux kernel for their
> hardware product.
> 
>  
> 
> I have contacted them, and their response is below:
> 
> "Thank you for your inquiry.
> Our company is using a standard BUILDROOT environment
> (http://buildroot.uclibc.org/) to produce the product.
> No modifications were made on original 2.6 kernel and other applications
> under the GPL licence.
> therefore we recommend you connect to http://buildroot.uclibc.org to get all
> extra information."
> 

Now that response reads as if the responder is working from the en_Chinese
version of the GPL.  ;-)

Seriously though. . .

There are a lot of devices coming out of Asian (and other) countries that have
had their firmware built under contract to the ODM (Original Device Manufacturer).

And then "Private Labled" by someone as their own OEM product.

If that response was from such an OEM - they honestly might not know;
If that response was from such an ODM - they may not be ready to say: "who wrote it".
So all you will probably get is "response F8" (or whatever the hotkey is there).

>  
> 
> Also, their product documentation and license doesn't mention at all GPL
> license in relation to the linux kernel (and other stuff used).
> 
>  
> 
> So, given a hardware unit with embedded linux kernel built with _buildroot_,
> what exact things does vendor have to provide:
> 
> -          In terms of documentation/license text?
> 
> -          In terms of source code and build environment (build and install
> scripts/steps)
> 

Good questions for an attorney - ask your lawyer.

Mike
>  
> 
> My assumptions are:
> 
> -          Documentation should mention the GPL license and the exact GPL
> modules used. Also, documentation should state how to get the necessary
> source code/configuration (FTP link, mailing address for CD order, etc.)
> 
> -          Source code (exact source tree or reference to an exact
> version/revision) as well as exact configuration/makefiles used for building
> the embedded environment (including configuration files for their buildroot
> development environment) 
> 
>  
> 
> Any advise is highly appreciated. 
> 
>  
> 
> Thanks a lot
> 
>  
> 
> Kind regards,
> 
> Andrei Costin
> 
> 
