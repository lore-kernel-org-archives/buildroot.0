From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:41:07 +0100
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: bump to version
 3.9.0
In-Reply-To: <0aa88f02-2da6-f6bd-6c21-b25b1df2af25@koncepto.io>
References: <1571765902-878-1-git-send-email-pjtexier@koncepto.io>
 <1571765902-878-2-git-send-email-pjtexier@koncepto.io>
 <20191024112430.at6l2alidwxxx4do@M43218.corp.atmel.com>
 <20191216104514.7a9fe980@windsurf.home>
 <0aa88f02-2da6-f6bd-6c21-b25b1df2af25@koncepto.io>
Message-ID: <20191223234107.36ef57e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre-Jean,

On Mon, 16 Dec 2019 18:33:23 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> > Pierre-Jean, could you double check ? Do you still have in your
> > download folder the tarball with the
> > 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e hash ?
> > If so, please don't delete it, and instead use it to compare it with
> > the current tarball that you can get by downloading from Github.  
> 
> Interesting, yes, I still have the tarball (from 22/10/2019), see after:
> 
> $: ls -l dl/at91bootstrap3
> total 452
> -rw-r--r--  1 pjtexier pjtexier 450749 oct.  22 18:35 
> at91bootstrap3-v3.9.0.tar.gz
> drwxr-xr-x 12 pjtexier pjtexier   4096 oct.  22 18:31 git
> -rw-r--r--  1 pjtexier pjtexier    512 oct.  22 18:35 git.readme
> 
> and the hash is:
> 
> $: sha256sum dl/at91bootstrap3/at91bootstrap3-v3.9.0.tar.gz
> 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e 
> dl/at91bootstrap3/at91bootstrap3-v3.9.0.tar.gz
> 
> I will check the difference ;)

Any news on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
