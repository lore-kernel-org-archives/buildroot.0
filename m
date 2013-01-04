From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 22:10:25 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.17
In-Reply-To: <50E74129.5050105@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 04 Jan 2013 17:52:57 -0300")
References: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
 <87hamwn0br.fsf@dell.be.48ers.dk> <50E74129.5050105@zacarias.com.ar>
Message-ID: <878v88mz7i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 >> Could you have a look at http://patchwork.ozlabs.org/patch/208318/ ?

 Gustavo> Yes, it's no longer required, part of 3.2.17
 Gustavo> Seems many people had issues with old enough headers and upstream
 Gustavo> decided to release .17 with those patches to fit it.
 Gustavo> Also fixes our previous autobuild errors which i assume went away when
 Gustavo> Thomas probably upgraded to new toolchain versions.
 Gustavo> We are talking about <2.6.32 headers IIRC.

Ok, thanks - I'll mark that patch as superseeded then.

-- 
Bye, Peter Korsgaard
