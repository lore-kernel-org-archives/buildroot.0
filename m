From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:43:01 +0100
Subject: [Buildroot] [PATCH] slang: make install-static do
	install-pkgconfig
In-Reply-To: <20160313211735.5c682f81@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 13 Mar 2016 21:17:35 +0100")
References: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
 <87mvq2gmo4.fsf@dell.be.48ers.dk>
 <20160313211735.5c682f81@free-electrons.com>
Message-ID: <87k2l6f6sq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter,
 > On Sun, 13 Mar 2016 21:14:51 +0100, Peter Korsgaard wrote:

 >> Patch description and signed-off-by missing. Alternatively we can drop
 >> the patch and just pass install-pkgconfig to the 'make install' step as
 >> we already need to use a custom make target anyway.

 > This is *exactly* what Max was doing in its first iteration of the
 > patch, to which Yann replied:

 > """
 > Could you instead fix the
 > 0002-Enable-a-statically-linked-version-of-slsh patch to have
 > install-static also depend on install-pkgconfig, please?
 > """

Ok, I missed that mail.

-- 
Venlig hilsen,
Peter Korsgaard 
