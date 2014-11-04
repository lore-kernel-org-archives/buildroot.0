From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 04 Nov 2014 13:44:18 -0300
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.1.4
In-Reply-To: <87y4rs0w4c.fsf@dell.be.48ers.dk>
References: <1414444421-821-1-git-send-email-gustavo@zacarias.com.ar>
 <87y4rs0w4c.fsf@dell.be.48ers.dk>
Message-ID: <54590262.7010101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/2014 07:14 PM, Peter Korsgaard wrote:

> I know it wasn't caused by this bump, but we have a number of autobuild
> issues related to RUBY_EXEC_PREFIX. Could you perhaps take a look
> (ignore the bfin ones)?
> 
> http://autobuild.buildroot.net/?reason=ruby-2.1.4
> http://autobuild.buildroot.net/?reason=ruby-2.1.3

Hi.
I'm unable to reproduce it.
And it seems to be limited to failures on gcc16 (the 2.1.3 bfin failures
are a different issue).
So i think it's something there since i've tested on a very old/bare
debian chroot here. Possibly a candidate for blacklisting.
Regards.
