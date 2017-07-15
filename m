From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Jul 2017 19:28:33 +0200
Subject: [Buildroot] Updates on http://autobuild.buildroot.net/ broken?
References: <jc2g1exqk8.ln2@ID-313208.user.individual.net>
 <20170618155512.026451aa@windsurf>
Message-ID: <1vvp3exgqd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 18 Jun 2017 15:55:12 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 17 Jun 2017 18:36:03 +0200, Bernd Kuhls wrote:
> 
>> the last reported build dates back to 0:54 am today, is there something
>> broken w.r.t. updating the results?
> 
> Thanks for reporting the issue. The problem was that the root filesystem
> was full, in terms of number of inodes, due to lighttpd mod_compress
> cache having filled in the entire filesystem with a large number of
> small files. This was preventing the upload of new results.

Hi Thomas,

the last reported build dates back to 9:13am today, did the inode problem 
occur again?

Regards, Bernd
