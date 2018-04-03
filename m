From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 15:17:55 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be> (Arnout
 Vandecappelle's message of "Tue, 3 Apr 2018 14:55:12 +0200")
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
Message-ID: <876058qvi4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Hi Thomas,
 >  Excellent write-up!

Yes, thanks!

 >  I know a few users that put their download directory on a samba share or a
 > virtualbox/vmware share which has NTFS as underlying filesystem. Although NTFS
 > does support hardlinks, I'm not sure that Samba and virtualbox/vmware do. Any
 > idea what will happen in such a case?

Then presumably the ln call will fail and we download the tarball again
in the new location?

-- 
Bye, Peter Korsgaard
