From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:00:56 +0100
Subject: [Buildroot] [PATCH v3] libgtk2: skip tutorial and faq build
In-Reply-To: <20150226165558.0A80BE0447@smtp.hushmail.com> (justin swartz's
 message of "Thu, 26 Feb 2015 18:55:57 +0200")
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk>
 <20150226165558.0A80BE0447@smtp.hushmail.com>
Message-ID: <874mq85o4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "justin" == justin swartz <justin.swartz@nym.hush.com> writes:

 > Fixes: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65165
 > Pass "DB2HTML=false" in LIBGTK2_CONF_ENV to disable the building of the
 > Tutorial and the FAQ.

 > Signed-off-by: Justin Swartz <justin.swartz@nym.hush.com>

Sorry, I had some email issues and ended up making a similar commit
locally before noticing your patch.

-- 
Bye, Peter Korsgaard
