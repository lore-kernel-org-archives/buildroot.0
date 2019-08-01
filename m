From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:54:30 +0200
Subject: [Buildroot] [PATCHv2] system: use system shell as root shell
In-Reply-To: <20190801104851.32619-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 1 Aug 2019 12:48:51 +0200")
References: <20190801104851.32619-1-yann.morin.1998@free.fr>
Message-ID: <87h870u36h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Philip Molloy <philip.a.molloy@gmail.com>
 > Signed-off-by: Philip Molloy <philip.a.molloy@gmail.com>
 > [yann.morin.1998 at free.fr: use the sytem shell, not a new option,
 >  as suggested by Arnout]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - drop the new option, use the system shell

Committed after extending the commit message with a description about
_WHY_ this is done (taken from Philip's help text), thanks.

-- 
Bye, Peter Korsgaard
