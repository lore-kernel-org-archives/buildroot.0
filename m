From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Fri, 23 Jan 2009 14:01:38 +0100
Subject: [Buildroot]  busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local><87d4egudlg.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local><8763k8uacw.fsf@macbook.be.48ers.dk><1232559369.11888.20.camel@elrond.atmel.com><5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local><877i4no5n7.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local><87zlhjml3m.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local><87sknbmjj4.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local><87wscml1t2.fsf@macbook.be.48ers.dk>
	<1232715723.5311.57.camel@elrond.atmel.com>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139AC4@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Robin> What ABI is recommended for Buildroot? I though that if
  Robin> selectable you should always choose EABI since it's newer?
 
 Peter> Well, it's newer, but potentinally less stable (as you see).
 Peter> Sorry, I don't work much with ARM, so I cannot say much more than that
 Peter> - Ulf?
 
Ulf> I OABI works and EABI doesn't then I am not going to drive EABI.
Ulf> Still way too many packages that does not build...

Ok, I guess I'll stick with OABI then as well for now. 
Could someone describe the differences? What is the reason for EABI
if it's not commonly used?

Best regards,
Robin



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090123/bcbf975a/attachment.htm 
