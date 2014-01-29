From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jan 2014 08:14:09 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <20140128230904.1f01a5dc@skate>
References: <52E4FA8C.7060109@gmail.com> <52E6945C.40202@mind.be>
 <52E8120F.7080805@gmail.com> <20140128230904.1f01a5dc@skate>
Message-ID: <52E8AA41.1020709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 23:09, Thomas Petazzoni wrote:
> Dear Marco Trapanese,
>
> On Tue, 28 Jan 2014 21:24:47 +0100, Marco Trapanese wrote:
>
>> Yeah! It did the trick!
>> I can't imagine it was a ccache problem because I deleted the whole
>> directory and cloned again the repository from scratch - I thought it
>> should reset anything to the initial state, my fault!
>
> No, it doesn't. The cache of ccache is located in
> ~/.buildroot-ccache/, because the intent of ccache is precisely to be
> able to re-use the cache contents across complete rebuilds, and even
> across multiple clones of Buildroot.

  But this is yet another proof that it doesn't work very well. And this 
one really worries me, because it's a host build that failed.

  Marco, can you try to remember exactly what was different between the 
first and second build? Was it the same buildroot source, the same 
buildroot config, etc.?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
