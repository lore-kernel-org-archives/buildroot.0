From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 17 May 2014 12:30:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-14
References: <20140515063008.42ABD100ECD@stock.ovh.net>
Message-ID: <obqj4bxae8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140515063008.42ABD100ECD at stock.ovh.net: 

>        arm |                     php-5.5.12 | NOK |
>        http://autobuild.buildroot.net/results/657781d2bc8e95ffc0478ecc9ce
>        954f7316df26e/

Hi,

currently I am trying to reproduce this build error, but without success.
I used the defconfig used by autobuild, but neither using "make", "make php" 
nor "make", followed by the packages shown in build-time.log in that precise 
order, triggers the php configure bug here.

Nonetheless, I found two missing optional dependencies in mysql, for which I 
will send a patch.

Regards, Bernd
