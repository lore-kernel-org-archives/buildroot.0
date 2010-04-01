From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 01 Apr 2010 15:42:31 +0100
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB20147.50404@terawatt.fr>
References: <4BB1EE15.6000505@browserseal.com> <4BB1F87D.4050706@terawatt.fr>
	<4BB1FA0F.5070703@carallon.com> <4BB20147.50404@terawatt.fr>
Message-ID: <4BB4B0D7.4080002@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/2010 14:48, Damien Borie wrote:
> Hi,
>
> Thank you for your answer.
> If you can send it it's great. But maybe you can first say me what the 
> modifications are?
> Modifying some line in configure file may be sufficient for some test? 
> I noticed an option PLATFORM_X11...
> I could always make it cleaner when you send your clean patch but if 
> there is only a few things to change I can do it dirtily for now and 
> continue working.
Damien,

Attached is my patch to get this working. he main thing to do is to 
trick the build into thinking it is doing a cross compile even though it 
is building for XOrg. Although not officially support the Trolltech guys 
confirmed that it should work.

There are various bits i the patch you may not like, not least that it 
is setup for a commercial Qt license.

Will.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: qt-x11.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100401/60f79536/attachment-0001.diff>
