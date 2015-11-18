From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 18 Nov 2015 20:24:21 +0100
Subject: [Buildroot] [PATCH/next 09/13]
 package/x11r7/xserver_xorg-server: add version 1.18.0
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
 <1447457203-27816-9-git-send-email-bernd.kuhls@t-online.de>
 <878u60i5me.fsf@dell.be.48ers.dk>
 <qrpkhcx89o.ln2@ID-313208.user.individual.net>
 <t4suhcxhbi.ln2@ID-313208.user.individual.net>
 <20151118193647.174c0d32@free-electrons.com>
Message-ID: <5svuhcx24v.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 18 Nov 2015 19:36:47 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Wed, 18 Nov 2015 19:20:45 +0100, Bernd Kuhls wrote:
> 
>> > nvidia-driver depends on ABI 19 (yes, I will send a patch in the next
>> > minutes, I do not use Nvidia hardware so i forgot about it), it is
>> > broken with X.org 1.18.0:
>> 
>> Nvidia issued an update, I will post a new patch series in the coming
>> days: http://www.nvidia.com/download/driverResults.aspx/95154/en-us
> 
> So thanks to this update we won't have to keep the ABI 19 compatible
> X.org server version, right?

Hi Thomas,

yes, I think so: https://github.com/OpenELEC/OpenELEC.tv/commit/
e5e95515c246a7676ce1227c9fbe1e07e6a9db19#commitcomment-14467959

I do not have Nvidia hardware to test myself, but I trust the OpenELEC 
project ;)

Regards, Bernd
