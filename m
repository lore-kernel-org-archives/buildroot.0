From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 10:13:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-02
In-Reply-To: <20141203090050.GB2234@tarshish> (Baruch Siach's message of "Wed, 
 3 Dec 2014 11:00:50 +0200")
References: <20141203073017.2AC17100ADA@stock.ovh.net>
 <87oarlywa8.fsf@dell.be.48ers.dk> <20141203090050.GB2234@tarshish>
Message-ID: <87k329yu3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> A lot of these seems to be because of download issues from sourceforge
 >> (returning HTML instead). Lets hope it is only a temporary issue.

 > Would it make sense to fallback to BR2_BACKUP_SITE 
 > (http://sources.buildroot.net) when there is a hash mismatch as in this case?

Well, yes - But we also want to be notified of these issues.

Yann has recently posted some patches reworking the hash verification
stuff. Perhaps we can come up with a sensible solution?

-- 
Venlig hilsen,
Peter Korsgaard 
