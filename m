From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Jan 2019 12:31:14 +0100
Subject: [Buildroot] [PATCH v2 0/4] Support Linux 4.20
In-Reply-To: <20190102091647.319e2c96@windsurf> (Thomas Petazzoni's message of
 "Wed, 2 Jan 2019 09:16:47 +0100")
References: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
 <87sgycox9n.fsf@dell.be.48ers.dk> <20190102091647.319e2c96@windsurf>
Message-ID: <877efnpa7x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Tue, 01 Jan 2019 22:58:44 +0100, Peter Korsgaard wrote:

 >> With 2019.02 becoming our next LTS and 4.20 NOT a LTS release, I wonder
 >> if it would make sense to still default to 4.19.x instead of 4.20.x?

 > Yes, that probably make sense. But in this case, we would need to get
 > in touch with the kernel folks to get the net_tstamp.h fix in -stable.
 > It has the Fixes: tag, but it still hasn't been backported to
 > 4.19-stable.

Ok. The last few 4.19.x releases did not contain any net/ fixes, perhaps
that will fixed now the holidays are over.

If not, will you take care of it?

-- 
Bye, Peter Korsgaard
