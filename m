From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Fri, 02 Oct 2020 11:03:40 +0200
Subject: [Buildroot] [git commit] arch: add the basic IBM s390x and Z
 arch support
In-Reply-To: <20200930213309.4f9b8063@windsurf.home>
References: <20200924213039.9A20F83786@busybox.osuosl.org>
 <20200930213309.4f9b8063@windsurf.home>
Message-ID: <87eemh6lub.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

>
> I was looking at this, together with the gcc documentation, and I was
> surprised to see that arch13/z15 are not mentioned anywhere. My gcc
> 10.x documentation says:
>
>      Generate code that runs on CPU-TYPE, which is the name of a system
>      representing a certain processor type.  Possible values for
>      CPU-TYPE are 'z900'/'arch5', 'z990'/'arch6', 'z9-109',
>      'z9-ec'/'arch7', 'z10'/'arch8', 'z196'/'arch9', 'zEC12',
>      'z13'/'arch11', 'z14'/'arch12', and 'native'.
>
> But looking at the gcc source code, the z15/arch13 -march values are
> indeed supported.
>
> Perhaps the gcc documentation should be updated. Alexander, as it seems
> you're working on S390 support in general, maybe you could take care of
> this ?
>
> Thanks!
>
> Thomas

Hi Thomas,
thank you for reporting this, i'll forward your message to the
responsible one.

Regards
Alex
