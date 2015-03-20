From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 20 Mar 2015 16:33:16 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <20150319092042.2875d9e1@free-electrons.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <20150319092042.2875d9e1@free-electrons.com>
Message-ID: <1426865596.27254.23.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Do, 2015-03-19 at 09:20 +0100, Thomas Petazzoni wrote:
> J?rg,
> 
> On Wed, 18 Mar 2015 21:01:06 +0100, J?rg Krause wrote:
> 
> > Are there any guidelines for reviewing?
> 
> Not really. Just pick patches touching things you are a bit comfortable
> with, give them some testing, and do some comments if needed. On the
> other hand, if you think the patch is fine, simply reply with a
> Reviewed-by tag.

To be honest, I'm only looking for packages I'm currently using or which
seems to be interesting to me. I must confess I don't have the time to
review/test patches I don't care about or which looks to complex.

Following the mailing list for some months now I noticed that there is a
team of five to ten main contributers which do the most reviews and
tests. Maybe a section in the documentation  

I think patches should be classified as you mentioned in another mail. I
like the idea have having tags like "infrastructure", "new package",
"version bump", ..., to get a quick overview.

> Of course, reviewing simple package bumps or hash file additions is not
> very useful, since I tend to apply such patches quickly: there is not
> much potential trouble with such patches.
> 
> > It's a pitty that GSoC did not accepted Buildroot this year. The
> > testing scripts would be a nice feature.
> 
> Yes, it is a pitty, but hopefully someone will pick up the task and
> work on improving our QA tooling :)

Hopefully!
