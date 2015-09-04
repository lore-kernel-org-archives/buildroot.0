From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 11:45:53 +0200
Subject: [Buildroot] [PATCH] make help: remove <pkg>-legal-info
In-Reply-To: <1441351061-6306-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 4 Sep 2015 09:17:41 +0200")
References: <1441351061-6306-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87wpw6o6um.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > The <pkg>-legal-info target is only a component of the top-level
 > legal-info target, it is not meant to be used alone.

 > For example, calling twice 'make busybox-legal-info' produces duplicate
 > entries in licenses.txt and manifest.csv.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
