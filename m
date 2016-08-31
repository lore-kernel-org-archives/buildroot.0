From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 08:15:57 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple
	trees at once (branch yem/multi-br2-external-ID-7)
In-Reply-To: <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be> (Arnout
 Vandecappelle's message of "Tue, 30 Aug 2016 23:37:33 +0200")
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be>
Message-ID: <874m611n1e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Supporting the old single-external without name in parallel with the new named
 > approach takes a significant amount of code - I estimate about 40 lines, out of
 > 285 lines affected by this patch set...

 >  So, I repeat: I think the backward compatibility should be dropped here.

That also sounds sensible to me.

-- 
Bye, Peter Korsgaard
