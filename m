From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 22:53:15 +0200
Subject: [Buildroot] [PATCH] wireguard: needs 3.10+ kernel
In-Reply-To: <0fb02bba-856e-2721-a482-37831b3a85fd@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Oct 2017 21:51:01 +0200")
References: <20171003080448.3809-1-peter@korsgaard.com>
 <0b87fcfb-da25-7574-3c7e-e3929383df71@mind.be>
 <8760btidhp.fsf@dell.be.48ers.dk>
 <0fb02bba-856e-2721-a482-37831b3a85fd@mind.be>
Message-ID: <87376xgvus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> That was my first thought as well, but it doesn't make much sense to
 >> build the user space part if the kernel is too old,

 >  That's true indeed, could you add that reasoning to the commit message? Then
 > there's no need to complicate the dependency.

 >> and I couldn't come
 >> up with a good and clear wording for the comment - So I opted to keep it
 >> simple.
 >> 
 >> But we can change it if you feel strongly about it. What do you suggest
 >> for the comment text?

 > 	# kernel module requires 3.10+, userspace makes no sense without it

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
