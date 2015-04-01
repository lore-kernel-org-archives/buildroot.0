From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 Apr 2015 23:48:49 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <20150401234340.1717eaf2@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Apr 2015 23:43:40 +0200")
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150401234340.1717eaf2@free-electrons.com>
Message-ID: <871tk3r03i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

> Also, there's something fishy between jamvm and classpath.

 > jamvm does select BR2_PACKAGE_CLASSPATH and has classpath in
 > JAMVM_DEPENDENCIES.

 > But classpath has depends on BR2_PACKAGE_JAMVM in its Config.in.

 > Does not make much sense. Peter, you followed the JamVM/Classpath
 > stuff. What do you think?

Hmm, that indeed doesn't sound right. I think the jamvm select should be
dropped from classpath.

-- 
Venlig hilsen,
Peter Korsgaard 
