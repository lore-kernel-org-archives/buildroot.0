From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 21:23:00 +0200
Subject: [Buildroot] Multi-File Kernel Module Build Fails
In-Reply-To: <20160426214928.5d518086@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 26 Apr 2016 21:49:28 +0200")
References: <CAN34fowqUhJX9LZ-7qkzr=20-dKFFX9r8suAuXpVnn-brbacQw@mail.gmail.com>
 <20160426214928.5d518086@free-electrons.com>
Message-ID: <87eg9pwnaj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 26 Apr 2016 14:44:28 -0400, Stephen Beckwith wrote:

 >> I posted this same issue last week and received no response.  After some
 >> more investigation and trying several different options, I am still STUCK
 >> and cannot move forward.

 > Since you didn't post your entire code, we're not able to reproduce the
 > exact same situation. However, to show how things can work, I've
 > created a minimal example of a kernel module with two C files and one
 > header file (to mimic your use case) and then the corresponding
 > Buildroot package.

 > See:

 >   http://thomas.enix.org/example-kernel-module.html

 > for all the files, both the kernel module itself and the Buildroot
 > packaging.

Nice! Notice that the browser ate the <> in your include statements of
mymod-test1.c. I believe you need to use &gt; / &lt; even within <pre>
tags.

-- 
Bye, Peter Korsgaard
