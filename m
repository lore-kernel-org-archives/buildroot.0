From: Michael.Forkey at elektrobit.com <Michael.Forkey@elektrobit.com>
Date: Wed, 21 May 2008 10:10:16 -0700
Subject: [Buildroot] GTK+ build supported?
In-Reply-To: <46a136670805201809y6cef3bcao27eba8f1dec5a6e0@mail.gmail.com>
Message-ID: <C681C76E0D5F1E4BB01DE79E0A80EEC76FB1FA@usrdes03.ebgroup.elektrobit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the reply, John. Sorry if these follow up questions are
stupid, but I am a complete newbie on most of this stuff - new to Linux,
new to Linux development and therefore GTK, new to embedded development,
new to Buildroot. Lots of learning curves.
 
I downloaded the latest Buildroot snapshot (20080521) and looked where
you suggested. But I still don't see it. I see some of its dependencies
- pango, atk, glib2. But nowhere do I see "GTK"-anything.
 
Is it known by some other name as well? 
 
Does the selected target architecture make a difference? I've selected
arm, arm926t variant. Although, I looked for it using a couple other
targets and didn't see it there either.
 
mf

________________________________

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of John Voltz
Sent: Tuesday, May 20, 2008 6:09 PM
To: Buildroot List
Subject: Re: [Buildroot] GTK+ build supported?




	Does buildroot support building GTK+ directly? I have been told
it does.
	But I don't see it as a option anywhere. Am I missing something?
	


Look under Package selection for the target ->  Graphic libraries and
applications 




	As a secondary question: does it build GTK-DFB?
	
	

 
Yes, it does. Just select DirectFB along with GTK.

John



----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080521/bbc54aae/attachment-0001.htm 
