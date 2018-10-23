From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 11:45:32 +0200
Subject: [Buildroot] [PATCHv2] core: support host gcc of the future
In-Reply-To: <20181023090840.18726-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 23 Oct 2018 11:08:40 +0200")
References: <20181023090840.18726-1-yann.morin.1998@free.fr>
Message-ID: <87h8hdgfnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we do a release, we know only of a set of gcc versions that the
 > host may have. But in the future, distributions with newer gcc versions
 > may show up.

 > Currently, we do not recognise those versions, and thus we do as if they
 > were older than the oldest we know of. This means that a set of packages
 > become unselectable, when they should be.

 > We fix that be capping the detected version to the highest we know of.

 > Reported-by: gargar_ on IRC
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - use a variable to store the highest version we know of  (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
