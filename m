From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Dec 2011 16:49:00 +0100
Subject: [Buildroot] [git commit] dropbear: bump to version 2011.54
In-Reply-To: <CAAXf6LVMmix+5RSbHDJKj09GGd_60Y6cBtSk2-+qODfOkvm2+g@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 1 Dec 2011 15:35:44
 +0100")
References: <20111201085828.CEE7D8F626@busybox.osuosl.org>
 <201112010722.35449.minimod@morethan.org>
 <20111201145224.197356c8@skate>
 <CAAXf6LVMmix+5RSbHDJKj09GGd_60Y6cBtSk2-+qODfOkvm2+g@mail.gmail.com>
Message-ID: <87sjl4gumr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> Just throwing the question out: should we adapt existing .mk files to
 Thomas> remove lines that correspond to the default? This is such an example,
 Thomas> and FOO_INSTALL_TARGET=YES is another one.

For _INSTALL_TARGET definately, yes.

-- 
Bye, Peter Korsgaard
