From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Oct 2013 14:47:30 +0200
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <525D3525.4020805@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 15 Oct 2013 09:29:25 -0300")
References: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
 <87fvs3pqml.fsf@dell.be.48ers.dk> <525C4F56.8010101@zacarias.com.ar>
 <87iowzoanz.fsf@dell.be.48ers.dk> <20131015102642.5f579a88@skate>
 <525D3525.4020805@zacarias.com.ar>
Message-ID: <874n8ilmzh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 10/15/2013 05:26 AM, Thomas Petazzoni wrote:
 >> At least mention that in package help text (that, IIUC, it normally
 >> depends on OpenSSH, but there are patches or other ways to make it work
 >> with Dropbear, possibly giving pointers to those patches).

 Gustavo> On a quick qemu run it works without tweaks - i didn't try the odd
 Gustavo> options though, just the basics.
 Gustavo> Looking at details the openwrt patch for autossh+dropbear is gone so
 Gustavo> evidently it's upstream (by looking at it).

Ok, great - Thanks for checking.

 Gustavo> No need to add anything up except maybe "remember to select a ssh
 Gustavo> package" (or depend on OPENSSH | DROPBEAR).

I guess the isn't really any sane use cases for autossh without a ssh
client, so I think we should use 'depends on'.

-- 
Bye, Peter Korsgaard
