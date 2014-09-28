From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:52:47 +0200
Subject: [Buildroot] [PATCH 1 of 2] check-kernel-headers: mktemp
	--tmpdir not available on RedHat 5
In-Reply-To: <808f5bf8-8245-43b5-ade0-a31e54105873@email.android.com> (Thomas
 De Schampheleire's message of "Sun, 28 Sep 2014 20:43:29 +0200")
References: <patchbomb.1409649944@localhost>
 <2c7735c0247a4c83a3c2.1409649945@localhost>
 <87mw9jwpu2.fsf@dell.be.48ers.dk>
 <808f5bf8-8245-43b5-ade0-a31e54105873@email.android.com>
Message-ID: <8738bbv7xs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> Redhat Linux 5.0, that was one of the very first Linux distributions I
 >> ever used - It's been a while ;) 
 >> 
 >> I guess you mean RHEL 5, so I've adjusted the commit message and
 >> committed, thanks.

 > Thanks, I do indeed mean RHEL5, wasn't aware that there was a difference.

https://en.wikipedia.org/wiki/Red_Hat_Linux

-- 
Bye, Peter Korsgaard
