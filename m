From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Aug 2016 11:40:32 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <20160830090018.GA5815@free.fr> (Yann E. MORIN's message of "Tue, 
 30 Aug 2016 11:00:18 +0200")
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160829221610.GC5829@free.fr>
 <b560c751-1ce1-f45a-5ab7-2e06ba169530@mind.be>
 <20160830090018.GA5815@free.fr>
Message-ID: <87bn0a388f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> For sure, the asciidoc support is even more difficult to understand and
 >> maintain than the normal package infras.

 > And I seem to have a good track-record at looking at it:

 >     $ git log --follow --pretty=%an package/doc-asciidoc.mk |sort |uniq -c  |sort -k1nr,2
 >          22 Yann E. MORIN
 >           8 Samuel Martin
 >           7 Thomas De Schampheleire
 >           2 Thomas Petazzoni
 >           1 Atul Singh
 >           1 J?r?me Pouiller

 > So, please, please. let's keep this asciidoc infra in place.

Yes, as long as it doesn't cause any problems I don't see any reason to
get rid of it.

-- 
Venlig hilsen,
Peter Korsgaard 
