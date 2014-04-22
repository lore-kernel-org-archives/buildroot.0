From: Parsa Panahi <panahi.parsa@paravisioner.com>
Date: Tue, 22 Apr 2014 13:29:22 +0430
Subject: [Buildroot] OpenCV compilation Error
In-Reply-To: <CAHXCMMJR3q-butnbGv=Ef5eoocKG2tSvMaCXSbhXm25grw+MSg@mail.gmail.com>
References: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
 <CAHXCMMJR3q-butnbGv=Ef5eoocKG2tSvMaCXSbhXm25grw+MSg@mail.gmail.com>
Message-ID: <0cd54f4c064b1a963403367a2385431b@paravisioner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi Samuel 

On 2014-04-22 13:19, Samuel Martin wrote: 

> Hi,
> 
> On Tue, Apr 22, 2014 at 10:30 AM, Parsa Panahi
> <panahi.parsa@paravisioner.com> wrote:
> 
>> Hi I checked opencv to be included in my kernel but When I make the buildroot it gives the following error for the opencv package. It seems it didn't find the gcc/cmake cannot compile the package. what's wrong and what should I do ?
> 
> It seems the toolchainfile.cmake is wrongly generated.
> Could you share your .config file?
> 
> Also could you tell us more about the step you've done to setup your
> configuration (e.g.: "make blabla_defconfig", then: "make menuconfig"
> and change this and that toolchain options)?
> 
> As a quick fix, you can try the following:
> rm /home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/share/buildroot/toolchainfile.cmake
> then, rerun the build
> 
> Regards,
> 
> --
> Samuel

All right, I've attached my config file. 
-- 

Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140422/990cbe34/attachment.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Myconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140422/990cbe34/attachment.ksh>
