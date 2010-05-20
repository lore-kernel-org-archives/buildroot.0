From: Cyril HAENEL <chaenel@free.fr>
Date: Thu, 20 May 2010 12:44:46 +0200
Subject: [Buildroot] Basic stupid questions regarding buildroot
In-Reply-To: <1A3C06457633904EAC567D23DA05171702AA8455@calrec-exch03.calrecaudio.com>
References: <1A3C06457633904EAC567D23DA05171702AA8455@calrec-exch03.calrecaudio.com>
Message-ID: <4BF5129E.7060607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le 20/05/2010 12:23, David Wooff a ?crit :
> Hi,
> sorry for these rather basic questions:
> 1.  If I download the latest version of buildroot, am I tied to a 
> particular version of the kernel?  I current have an old buildroot 
> (from late last year and kernel 2.6.30, but I'm going to download the 
> latest buildroot because I'm having compilation problems (since I did 
> a "clean") and it has been suggested that I use the latest version.  I 
> currently build the kernel separately.
> 2. Regarding pre-requisite "packages" or build tools, if I have to 
> manually download a toolset of some description, where does it have to 
> live?  Is this automatically "known" by any application which might 
> want to use it?  Is there a list of anything I need to manually 
> install before attempting to build buildroot?
> Many thanks,
> Dave W.
Hi, I can answer to the question 1 :
I use buildroot for an arm processoir based board, and I build the 
kernel separately. I work with a 2.6.27 kernel, I use buildroot release 
2010.02, and everything works well. Before I was using release 2009-02, 
but I changed to 2010.02 for the same reason, compilation problems after 
make clean ;)
So I alway use my 2.6.27 kernel, I just changed its configuration to use 
EABI because buildroot release 2010.02 use EABI by default.

Regards,
Cyril HAENEL

-- 

Cyril Haenel
Registered Linux User #332632
