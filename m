From: Steve Bennett <sablists@earthlink.net>
Date: Wed, 5 Aug 2009 13:19:54 -0400
Subject: [Buildroot] v86d?
Message-ID: <50030A7F-0D3D-444C-8635-6D7FF382A4ED@earthlink.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Is there a v86d package for buildroot?   I found a reference to one  
being added last november as part of bug 5914 ("add 915resolution and  
v86d") in a google search, but nothing beyond that.  Apparently that  
bug was part of an old bug tracking system -- it doesn't seem to  
exist in the new system and there's no further reference to v86d I  
could find.

The main reason I ask is that I'm having no end of trouble with  
Xvesa, which was my original plan of attack.  The mouse is erratic  
for several seconds after you switch to X, and no amount of mucking  
can get keyboard input working.  Ctrl-Alt-Fx works and that's it, and  
if I add -keybd keyboard to the Xvesa command line, even *that* stops  
working.  (If anyone has suggestions for these issues, I'd love to  
hear them -- otherwise, I'm giving up on Xvesa...)

A search of the Xorg mailing lists reveals that Xvesa has actually  
been removed from the development tree and I saw a suggestion to use  
Xfbdev with uvesafb instead.  I'm a little unsatisfied with this  
since it means dropping support for any video card which doesn't have  
VBE 2.0, and we're trying to get this to run on things going back to  
old i486 machines -- but right now the Xvesa input problems make it  
unusable.

But uvesafb needs v86d.   I could add that manually, but I was  
wondering if anything ever happened with adding that to buildroot?

-->Steve Bennett
