From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 15 Apr 2014 09:52:28 +0100
Subject: [Buildroot] yaffs2 file system
In-Reply-To: <CABzetm2LegsUVAH0a-3UYWNQcf2inSG4P8r5A6goGKNbJKsVVw@mail.gmail.com>
References: <CABzetm2LegsUVAH0a-3UYWNQcf2inSG4P8r5A6goGKNbJKsVVw@mail.gmail.com>
Message-ID: <534CF34C.4050808@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/2014 09:32, Rohit Kumar wrote:
> Hello,
>
> i want to create yaffs2 file system with buildroot.
> i see that buildroot doesnt have this option. so i have created standard
> uncompressed image.
> is there a way to convert it to yaffs2 FS?
> any help is appreciated.

Hi Rohit,

I have a couple of patches (attached) that add yaffs2 support for 
buildroot, that I have never got round to pushing upstream. They are 
based on buildroot_2013.05.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
