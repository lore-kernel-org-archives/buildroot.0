From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 15:36:34 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
In-Reply-To: <CAOR3GqU17TUskOwG_8DfwrcEt_AJcqzgD8=5j1c2Wa+LVveeSg@mail.gmail.com>
 (Esben Haabendal's message of "Wed, 20 Mar 2019 14:53:07 +0100")
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
 <875zseitgs.fsf@dell.be.48ers.dk>
 <CAOR3GqXSxZw3m+OD3FLCFOR0Gi-v3zNJGe2+3Bhy7R6av7LVhQ@mail.gmail.com>
 <875zsdek04.fsf@dell.be.48ers.dk>
 <CAOR3GqU17TUskOwG_8DfwrcEt_AJcqzgD8=5j1c2Wa+LVveeSg@mail.gmail.com>
Message-ID: <871s31ehot.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esbenhaabendal@gmail.com> writes:

Hi,

 >> Ok. Out of interest, what is gummiboot adding over just directly booting
 >> a Linux kernel with CONFIG_EFI_STUB?
 >> 

 > With gummiboot, I can point to a separate initramfs file. I haven't figured
 > out
 > how to do that with CONFIG_EFI_STUB, as the CONFIG_CMDLINE args
 > are not processed by the EFI stub.

I have never tried, but it looks as if you can just set
initrd=<path/to/initramfs/in/esp>

https://www.kernel.org/doc/Documentation/efi-stub.txt

-- 
Bye, Peter Korsgaard
