From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 14:10:42 +0100
Subject: [Buildroot] Buildroot and ClassPath
In-Reply-To: <50B721D7.4050607@univ-rouen.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-7-git-send-email-yann.morin.1998@free.fr>
 <20121129094247.03f7c7d2@skate> <50B721D7.4050607@univ-rouen.fr>
Message-ID: <20121129141042.28c5c072@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alain Mouflet,

First of all, please don't use an existing message of the list when
starting a new thread: you break discussion threads.

On Thu, 29 Nov 2012 09:50:31 +0100, Alain Mouflet wrote:

> I'm trying to add classPath and Jamvm to build root.
> I've got the fixjava.patch of D.Smyth then I can compile jamvm but... on 
> my rootfs, I haven't the /usr/share/classpath/ directory...

We used to have packages for jamvm and classpath in Buildroot, but
nobody was maintaining/updating them, so we removed them. You can still
find them in the Git history of the project, though.

Regarding your specific problem, it's impossible to help you: you don't
even give the modifications you've made to Buildroot, nor your
Buildroot configuration. There's no way we can help you if you don't
provide all the details needed for us to reproduce the situation you're
seeing.

See http://www.catb.org/esr/faqs/smart-questions.html#beprecise

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
