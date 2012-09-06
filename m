From: Vimal Menon <vimalmenon@yahoo.com>
Date: Thu, 6 Sep 2012 07:04:01 -0700 (PDT)
Subject: [Buildroot] Python running very slow with buildroot 2012.05
Message-ID: <1346940241.6846.YahooMailNeo@web110707.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Team,

I happened to download and install buildroot (default 2012.05), while checking the compiled image, I saw that python runs very slow.
for eg:

On a standard linux, Python 2.7.2 complied with glibc

#time python -c "print 'hello world'" 

hello world

real??? 0m0.077s
user??? 0m0.068s
sys???? 0m0.009s

and the same command ran on the same machine with the buildroot compiled image (not via qemu, but with the image booted through grub), python takes a lot more time

#time python -c "print 'hello world'" 

hello world
real??? 0m 0.28s
user??? 0m 0.26s
sys???? 0m 0.01s

Why would there be such a huge difference? What might I have done wrong? Has anybody of you come across such a situation?

Thanks,
Vimal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120906/694993f0/attachment-0001.html>
