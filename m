From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 9 Dec 2009 20:39:45 +0000 (UTC)
Subject: [Buildroot] Documentation question
Message-ID: <hfp1uh$6fk$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been reading the "buildroot usage and documentation"
document over the past couple days, and in order to not be a
complete leech, I'm fixing various minor problems (typos,
spelling, punctuation, usage, grammar, etc.) and will submmit a
patch when I've finished.

However, I've run across one paragraph where I think the actual
content could use a tweak, and I thought I should ask about it
before making a change.  In the section "Using Buildroot"
there's a paragraph that describes what the top-level "make"
does:

   $ make

     This command will download, configure and compile all the
     selected tools, and finally generate a toolchain, a root
     filesystem image and a kernel image (or only one of these
     elements, depending on the configuration). 

Doesn't the toolchain have to be generated _before_ the
selected tools are configured and compiled?

IOW, "generate a toolchain" seems to me to be in the wrong
place in the sequence.  Right?

-- 
Grant Edwards                   grante             Yow! I just forgot my whole
                                  at               philosophy of life!!!
                               visi.com            
