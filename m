From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 17:27:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <CAMo8BfKRHRtzpxNQpOyhpEf3EwxLL6ioRN+Kv0iSoSvkxWQDQA@mail.gmail.com>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
 <CAMo8BfKRHRtzpxNQpOyhpEf3EwxLL6ioRN+Kv0iSoSvkxWQDQA@mail.gmail.com>
Message-ID: <20140330172703.4232fd90@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat, 29 Mar 2014 21:06:40 +0400, Max Filippov wrote:

> On Sat, Mar 29, 2014 at 8:54 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >>     xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/db06965d3984ab6ca5e039f0e35d4be8638c488b/
> >
> > Baruch, this is a Xtensa specific failure, can you have a look ?
> 
> A fix for this and other similar issue with wireshark was posted last sunday:
> http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/80105
> 
> For this fix to be complete we need the following patch to be merged to uclibc:
> http://permalink.gmane.org/gmane.comp.lib.uclibc.general/23828

Can you send a Buildroot patch that adds this uClibc patch to the
Xtensa version? This way, I could test that both of the patches
combined solve the wireshark and mplayer problems.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
