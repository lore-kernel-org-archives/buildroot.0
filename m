From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 19 Nov 2016 14:49:27 +0100
Subject: [Buildroot] [PATCH v2 03/15] reproducible: add '-n' to gzip
	invocations
In-Reply-To: <ce34ec94-7d1f-56d9-0063-42fd003a2418@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-4-git-send-email-jezz@sysmic.org>
 <ce34ec94-7d1f-56d9-0063-42fd003a2418@mind.be>
Message-ID: <2527638.eCg5RPtaPY@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Saturday 19 November 2016 10:02:46 Arnout Vandecappelle wrote:
> 
> On 18-11-16 10:10, J?r?me Pouiller wrote:
> > Default invocation to gzip include timestamp in output file. This feature is
> > incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.
> > 
> > The environment variable GZIP can hold a set of default options for gzip. So
> > instead to find all gzip invocation in build process, we just export 'GZIP=-n'.
> > 
> > Notice bzip2, lzma and xz are impacted by this problem. On the other hand, lzop
> 
>  Unless I'm very mistaken, they are NOT impacted by this problem.

Sure!

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
