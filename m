From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jun 2021 16:11:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsync: fix CVE-2020-14387
In-Reply-To: <87wnqzduqb.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 12 Jun 2021 16:26:52 +0200")
References: <20210612120210.53537-1-fontaine.fabrice@gmail.com>
 <87wnqzduqb.fsf@dell.be.48ers.dk>
Message-ID: <87y2b4bp8l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +RSYNC_IGNORE_CVES += CVE-2020-14387

 > Committed after adding a

 > # 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch 

 > Comment in front of this, thanks.

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
