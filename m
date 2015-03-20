From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 16:37:50 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <1426865596.27254.23.camel@embedded.rocks>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <20150319092042.2875d9e1@free-electrons.com>
 <1426865596.27254.23.camel@embedded.rocks>
Message-ID: <20150320163750.745ba46c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 20 Mar 2015 16:33:16 +0100, J?rg Krause wrote:

> To be honest, I'm only looking for packages I'm currently using or which
> seems to be interesting to me. I must confess I don't have the time to
> review/test patches I don't care about or which looks to complex.

Yes, this is fine: if everyone takes care of patches touching packages
he is interested in, it would already help a lot.

For example, there are many systemd patches waiting for someone
knowledgeable in systemd stuff to look at them. We used to have Eric Le
Bihan taking care of such patches, but he is no longer active.
Fortunately, Mike Williams and Steven Noonan have appeared and seem to
be interested in systemd, which is great!

> Following the mailing list for some months now I noticed that there is a
> team of five to ten main contributers which do the most reviews and
> tests.

Correct, but as you can see by looking at the patch queue, it's not
enough.

> Maybe a section in the documentation  

Incomplete sentence?

> I think patches should be classified as you mentioned in another mail. I
> like the idea have having tags like "infrastructure", "new package",
> "version bump", ..., to get a quick overview.

True, but on the other hand, someone will have to add those tags
manually for each patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
