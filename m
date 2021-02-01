From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 13:21:12 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: properly
 handle host packages with -c option
In-Reply-To: <20210201115521.0cba330a@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 1 Feb 2021 11:55:21 +0100")
References: <20210131214120.170C981562@busybox.osuosl.org>
 <87mtwonl2n.fsf@dell.be.48ers.dk>
 <20210201115521.0cba330a@windsurf.home>
Message-ID: <87eei0nflz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 01 Feb 2021 11:23:12 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > +    return set([v["name"] for _, v in js.items()])  
 >> 
 >> If we don't care about the key at all, why not just use js.values()?

 > 'cause I didn't know about <dict>.values() :-)

Ok, will send a patch.

-- 
Bye, Peter Korsgaard
