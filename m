From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 30 Jun 2015 09:17:49 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-06-29
In-Reply-To: <20150630140738.526d72b8@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
Message-ID: <559288ED.3010704@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/06/15 09:07, Thomas Petazzoni wrote:

Hi Thomas.

>>           arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/bf3c76738c453363bb1ed3ef228ae2877f569f3d/
>
>    CCLD     collectd
> libtool: link: cannot find the library `libavltree.la' or unhandled argument `libavltree.la'
> make[4]: *** [collectd] Error 1
>
> I don't know. Gustavo, you are the most active contributor on collectd.
> Can you have a look?

It's a parallel build issue, i'll look into it.

>> microblazeel |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/3361f1ff493fa96b9dd6b7f896c2ec229661ba54/
>>          i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/f12af085e4a8b148e550b6f37fd07b27f6e36927/
>>           arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/0e51b1350de547b907db2e9b938f72e5b00aa265/
>>           arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/940211b60542134adc71b20fbff856d6655398ba/
>>           arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/59de4d5ae3a20b1b9940c061c3d630931c09b1bc/
>>          sh4a |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9dd68a889299ee4ca09ceea2aeb11c0a26972e1d/
>> microblazeel |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/f1a7341681e0a438e64ea26a1823b073ba6012a5/
>>          i686 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/894d7a61cca9f74f5aac44240a017800c02a3a4a/
>>        xtensa |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9952aaf1616d72ee09e9bd0a2b2051618d5f8b11/
>>           arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/708c651274744a2352de212ab38648c87c47430c/
>>       powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/9d3a31b810ac3160a0b91d50b8c720e2c227b48d/
>>          sh4a |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/c572a58b62e51898fc03d8c9f5862ddae9cf9ad3/
>>           arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/6d792ce3f540a6fe2933dd14d1b6c3313b15e1e7/
>>          mips |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/956f75e34d3939206deebd02332863d8b4096d92/
>>       powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/7f89f83b3f6b05f41e56a59f75ee46b1f634c5c8/
>
> All fixed by
> http://git.buildroot.net/buildroot/commit/?id=84f6eb9fe3467abbd94a6b481ae5106679d61e24.

I should have emailed about this earlier, i didn't miss the hash, in 
fact it's perfectly fine, look at 
http://download.pureftpd.org/pub/pure-ftpd/releases/distinfo
The md5 hash stated there matches my previous tarball and my previous 
tarabll sha256, and the file timestamp predates the tarball... so 
upstream pulled a switcharoo.
I'm ok with the revised hash since it matches the signature, but it 
wasn't my fault :)

Regards.
