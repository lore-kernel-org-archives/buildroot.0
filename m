From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Jun 2017 18:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump version to 1.7.0
References: <20170603131253.10900-1-bernd.kuhls@t-online.de>
 <20170603171152.3f5f47ab@free-electrons.com>
Message-ID: <cb3b0exh1d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 03 Jun 2017 17:11:52 +0200 schrieb Thomas Petazzoni:

> When I try to apply this patch, I get:
> 
> thomas at skate:~/projets/buildroot (master)$ git pwam 770780
> Applying patch #770780 using 'git am -s'
> Description: [1/1] package/libldns: bump version to 1.7.0
> Applying: package/libldns: bump version to 1.7.0
> fatal: corrupt patch at line 704

Hi Thomas,

git send-email complained about a patch line longer than 998 chars which 
I ignored by using --no-validate, I guess this line was 704 ;)

Bottom line: You can remove all patches from the package, as they are 
included in 1.7.0.

Regards, Bernd
