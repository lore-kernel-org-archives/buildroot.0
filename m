From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 14:48:59 +0100
Subject: [Buildroot] svn commit: [25817] trunk/buildroot/docs:  images
In-Reply-To: <20090326140121.4a7f3922@surf> (Thomas Petazzoni's message of
	"Thu\, 26 Mar 2009 14\:01\:21 +0100")
References: <20090325155430.6477B76A00@busybox.osuosl.org>
	<20090326140121.4a7f3922@surf>
Message-ID: <873ad0ied0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 25 Mar 2009 15:54:30 +0000 (UTC),
 Thomas> jacmet at uclibc.org a ??crit :

 >> Added:
 >> trunk/buildroot/docs/images/menuconfig.png
 >> trunk/buildroot/docs/images/menuconfig_small.png

 Thomas> It seems that SVN didn't get the fact that these files are binary files
 Thomas> (probably because you're using git-svn). See
 Thomas> <http://svnbook.red-bean.com/en/1.1/apas08.html>. The svn:mime-type
 Thomas> property should be set on those files.

Ahh yes, thanks - Fixed in r25826.

-- 
Bye, Peter Korsgaard
