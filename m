From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:04:57 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libsodium: add config for
 full build
In-Reply-To: <91913550-aa51-4b85-225b-e1b674e91e66@mind.be> (Arnout
 Vandecappelle's message of "Sun, 29 Sep 2019 12:51:35 +0200")
References: <20190923082902.28472-1-adrien@gallouet.fr>
 <20190928231934.236e5f83@windsurf>
 <CAFtSRGDT0udQCby-XzsZTe-VUTBSva7cdrh6wpZ_nMf+J8Pz2Q@mail.gmail.com>
 <20190929090408.67e6d38e@windsurf>
 <91913550-aa51-4b85-225b-e1b674e91e66@mind.be>
Message-ID: <87muem56s6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Arnout, Peter, any preference ?

 >  It was me who suggested to turn around the logic.

 >  I believe we have had problems in the past where there was some MINIMAL option,
 > but then some other package needed something from the non-minimal set. Then it
 > has to do a 'depends on' instead of a 'select'.

 >  So it's not a matter of being weird, it's a matter of making sure we don't
 > create problems in the future.

Yes, indeed - I would prefer to keep it like this (a "positive" option).

 >>> Also, we need to pass --disable-minimal in an "else" clause.

 >  This is still true. Adrien, I believe I did say something to that effect in an
 > earlier iteration, and I also believe you replied to it. But my memory is
 > worthless :-)

Heh ;)

-- 
Bye, Peter Korsgaard
