From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 23:48:16 +0200
Subject: [Buildroot] Resource Limits
In-Reply-To: <CAHXCMMLEuPHKHp5uwvxmzJMMwDg4HSVesDe7utRauYpgphzxcA@mail.gmail.com>
 (Samuel Martin's message of "Tue, 7 Jun 2016 21:01:17 +0200")
References: <CAF_dkJCCZcXdf=G8TJ1HUA1TiCAmbE56oA6KkWMyxcLrkxgo-w@mail.gmail.com>
 <CAHXCMMLEuPHKHp5uwvxmzJMMwDg4HSVesDe7utRauYpgphzxcA@mail.gmail.com>
Message-ID: <87mvmowyjj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 >> Can I use sysctl?  Is that a package I can enable?
 > According to [2] sysctl is provided by procps-ng.
 > You can check whether this package is available in Buildroot on [3].

FYI, it is also available as a busybox applet (or you can use echo foo >
/proc/sys/..)

-- 
Bye, Peter Korsgaard
