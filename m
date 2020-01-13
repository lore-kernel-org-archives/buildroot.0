From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 16:45:41 +0100
Subject: [Buildroot] [PATCH 1/2] libmodescurity: new package
In-Reply-To: <a94f6405-b567-cc14-a114-812bbdf0b977@mind.be> (Arnout
 Vandecappelle's message of "Mon, 13 Jan 2020 16:33:07 +0100")
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
 <87d0brmj8i.fsf@dell.be.48ers.dk>
 <a94f6405-b567-cc14-a114-812bbdf0b977@mind.be>
Message-ID: <87tv4zbbru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > +-    exit
 >> > ++    exit 1
 >> 
 >> What is the use of this patch in Buildroot? I mean, it looks correct but
 >> we should ensure the configure script can correctly detect
 >> CANONICAL_HOST (whatever that is), so this should never trigger?

 >  Without this patch, if there is some platform for which CANONICAL_HOST does not
 > get set correctly, you get a very cryptic error instead of a failure of the
 > configure step. So hopefully this patch isn't needed, but if it is actually
 > needed because CANONICAL_HOST is still not correct, it helps us a lot.

 >  In other words, I would keep it in Buildroot.

Fine by me, and it hopefully will soon be applied upstream.

-- 
Bye, Peter Korsgaard
