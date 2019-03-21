From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 21 Mar 2019 10:56:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-03-20 -> Obsoleting qjson
In-Reply-To: <cmu-lmtpd-13789-1553152992-0@imapb020.mykolab.com>
References: <cmu-lmtpd-13789-1553152992-0@imapb020.mykolab.com>
Message-ID: <5028757.eHhpGmRVMb@zgyarmati-thinkpad-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Donnerstag, 21. M?rz 2019 08:00:32 CET Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2019-03-20, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>       x86_64 |                    qjson-0.9.0 |
> http://autobuild.buildroot.net/results/042144b4b6122f206e834d0efe171d68b0c8
> e5df i586 |                    qjson-0.9.0 |
> http://autobuild.buildroot.net/results/6fb17d7de75fc7939d2d7aad88be1a692626
> a5f3



Dear Community,

given that qjson was mostly relevant on Qt4, and hopefully everyone migrated 
to Qt5 already and using the built-in QJson* classes, i would propose to 
remove the qjson package.
Are there any active users of the qjson package out there? If so, please let 
me know, and I'll look into this build failure, but if there is none, I'll 
send a patch to retire it.

-- 
Zoltan Gyarmati
https://zgyarmati.de
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190321/dfa73b4f/attachment.asc>
