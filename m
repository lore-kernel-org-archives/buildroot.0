From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 May 2015 00:27:10 +0200
Subject: [Buildroot] Are these packages already present or easy to add?
In-Reply-To: <CA+BV=GWq-a_Jvma7X9DBpbYUPyPhRkU=L3+BJ9yffWQV3iT8dg@mail.gmail.com>
References: <CA+BV=GWq-a_Jvma7X9DBpbYUPyPhRkU=L3+BJ9yffWQV3iT8dg@mail.gmail.com>
Message-ID: <5567963E.3070900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 16:36, Jo wrote:
> Hi,
> 
> For my open-source project www.samplerbox.org, I think that using
> Buildroot would be great (fast boot time, etc.).
> 
> The requirements for https://github.com/josephernest/SamplerBox  are:
> 
> * python-dev  (probably already there?)

 Buildroot doesn't have separate -dev packages, so it's just the python package.

> * cython   (not needed on target, only on host)

 Peter Bouda just posted a patch to add it.

> * python-smbus    (present?)

 That's part of i2c-tools.

> * portaudio19-dev    (present?)

 Just portaudio.

> * https://github.com/superquadratic/rtmidi-python.git       (to be done...)
> * http://people.csail.mit.edu/hubert/git/pyaudio.git           (to be done...)

 Indeed these are to be done, but adding python packages is generally not hard.
Read the manual and look at some of the existing python-* packages for examples.


 Regards,
 Arnout

> 
> I imagine you are already busy on lots of projects, but if some of you
> have skills to build  the missing packages or contribute to making a
> Buildroot for SamplerBox, it would help me a lot.
> 
> I will happily donate for help :)
> 
> Best
> 
> Jo
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
