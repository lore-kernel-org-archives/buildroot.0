From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Tue, 6 Oct 2015 16:59:06 -0600
Subject: [Buildroot] Add [user@host dir] back to skeleton /etc/profile
Message-ID: <5614523A.2090204@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed there was a commit pushed Saturday (f93c692c) which removed 
some bash-specific stuff from the skeleton shell profile in 
/etc/profile.  The default behavior for the shell prompt now is to only 
display "$" or "#", without the [user at host dir] prefix.  I just 
subscribed to the list today so I missed out on any discussion on this; 
was there a reason the [user at host dir] prefix was not left in the 
changes ("export PS1="[\u@\h \W]\\$ "")?  I have not encountered a Linux 
distribution that does not display this or a similar prompt, and I think 
it would be beneficial to add it back in.  I agree that the aliases, 
colors, etc should stay removed.

Thanks,
David
