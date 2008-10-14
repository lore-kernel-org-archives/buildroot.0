From: John Schimandle <john_schimandle@hotmail.com>
Date: Tue, 14 Oct 2008 08:46:35 -0700
Subject: [Buildroot] docs/buildroot.html - how to add application software
Message-ID: <COL0-DAV27CF0F9BA74FBE354DA5B98D310@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm new to the buildroot community so first I'd like to introduce myself.
I'm John Schimandle and I'm glad to be here and hopefully my 28 years of
experience in the computer engineering field will be of some use to all of
you. I'm excited to start using embedding linux on my embedded hardware
platforms I design. My job is to design the hardware and then provide a base
development platform for my clients to develop their software.
 
After a bit of struggling I have compiled, built and booted a target system
for my at91sam9263ek development board. Now I would like to add some
application software. I was reading the buildroot usage and documentation
document at docs/buildroot.html specifically the section entitled "Extending
Buildroot with more software". I followed the instructions and worked
through my syntax errors on the files but could not get the new package to
show up in menuconfig. After much searching I found a file named
package/Config.in which controls the appearance of the package selections in
menuconfig. After modifying this file with my new package I was able to see
my new package in menuconfig. I went back and looked at docs/buildroot.html
and could not find any mention of the package/Config.in file.
 
I'm wondering if this is the expected behavior of the system. If so, I would
like to submit a patch to buildroot.html to document the existence of the
package/Config.in file and how to add your new package to it.
 
Let me know if this is how the menuconfig/package subsystem is supposed to
work.
 
If there is a better way to add application software to buildroot I'd like
to hear about that as well.
 
Regards,
 
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081014/6a9270bd/attachment.htm 
